// driver is a binary for driving the CI process based on the affected targets.
package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/bazel-contrib/target-determinator/cli"
	"github.com/bazel-contrib/target-determinator/pkg"
	"github.com/bazel-contrib/target-determinator/third_party/protobuf/bazel/analysis"
	"github.com/bazelbuild/bazel-gazelle/label"
)

type driverFlags struct {
	commonFlags    *cli.CommonFlags
	revisionBefore string
}

type config struct {
	Context        *pkg.Context
	RevisionBefore pkg.LabelledGitRev
	Targets        pkg.TargetsList
}

func main() {
	log.SetFlags(0)

	flags, err := parseFlags()
	if err != nil {
		fmt.Fprintf(flag.CommandLine.Output(), "Failed to parse flags: %v\n", err)
		fmt.Fprintf(flag.CommandLine.Output(), "Usage of %s:\n", os.Args[0])
		fmt.Fprintf(flag.CommandLine.Output(), "  %s <before-revision>\n", filepath.Base(os.Args[0]))
		fmt.Fprintf(flag.CommandLine.Output(), "Where <before-revision> may be any commit-like strings - full commit hashes, short commit hashes, tags, branches, etc.\n")
		fmt.Fprintf(flag.CommandLine.Output(), "Optional flags:\n")
		flag.PrintDefaults()
		os.Exit(1)
	}

	config, err := resolveConfig(*flags)
	if err != nil {
		log.Fatalf("Error during preprocessing: %v", err)
	}

	var targets []label.Label
	targetsSet := make(map[label.Label]struct{})
	commandVerb := "build"

	log.Println("Discovering affected targets")
	callback := func(l label.Label, differences []pkg.Difference, configuredTarget *analysis.ConfiguredTarget) {
		if isTaggedManual(configuredTarget) {
			return
		}
		if _, seen := targetsSet[l]; seen {
			return
		}
		targets = append(targets, l)
		targetsSet[l] = struct{}{}
		// This is not an ideal heuristic, ideally cquery would expose to us whether a target is a test target.
		if strings.HasSuffix(configuredTarget.GetTarget().GetRule().GetRuleClass(), "_test") {
			commandVerb = "test"
		}
	}

	if err := pkg.WalkAffectedTargets(config.Context,
		config.RevisionBefore,
		config.Targets,
		false,
		callback); err != nil {
		log.Fatal(err)
	}

	if len(targets) == 0 {
		log.Println("No targets were affected, not running Bazel")
		os.Exit(0)
	}

	log.Printf("Discovered %d affected targets", len(targets))

	targetPatternFile, err := os.CreateTemp("", "")
	if err != nil {
		log.Fatalf("Failed to create temporary file for target patterns: %v", err)
	}
	for _, target := range targets {
		if _, err := targetPatternFile.WriteString(target.String()); err != nil {
			log.Fatalf("Failed to write target pattern to target pattern file: %v", err)
		}
		if _, err := targetPatternFile.WriteString("\n"); err != nil {
			log.Fatalf("Failed to write target pattern to target pattern file: %v", err)
		}
	}
	if err := targetPatternFile.Sync(); err != nil {
		log.Fatalf("Failed to sync target pattern file: %v", err)
	}
	if err := targetPatternFile.Close(); err != nil {
		log.Fatalf("Failed to close target pattern file: %v", err)
	}

	buildBuddyAPIToken := os.Getenv("BUILDBUDDY_API_KEY")

	args := []string{
		commandVerb,
		"--target_pattern_file", targetPatternFile.Name(),
	}

	if buildBuddyAPIToken != "" {
		args = append(args, "--remote_header=x-buildbuddy-api-key="+buildBuddyAPIToken)
	}

	log.Printf("Running %s on %d targets", commandVerb, len(targets))
	result, err := config.Context.BazelCmd.Execute(
		pkg.BazelCmdConfig{Dir: config.Context.WorkspacePath, Stdout: os.Stdout, Stderr: os.Stderr},
		[]string{},
		commandVerb,
		args...,
	)
	if err != nil || result != 0 {
		log.Fatal(err)
	}
}

func isTaggedManual(target *analysis.ConfiguredTarget) bool {
	for _, attr := range target.GetTarget().GetRule().GetAttribute() {
		if attr.GetName() == "tags" {
			for _, tag := range attr.GetStringListValue() {
				if tag == "manual" {
					return true
				}
			}
		}
	}
	return false
}

func parseFlags() (*driverFlags, error) {
	var flags driverFlags
	flags.commonFlags = cli.RegisterCommonFlags()
	flag.Parse()

	var err error
	flags.revisionBefore, err = cli.ValidateCommonFlags()
	if err != nil {
		return nil, err
	}

	return &flags, nil
}

func resolveConfig(flags driverFlags) (*config, error) {
	commonArgs, err := cli.ResolveCommonConfig(flags.commonFlags, flags.revisionBefore)
	if err != nil {
		return nil, err
	}

	return &config{
		Context:        commonArgs.Context,
		RevisionBefore: commonArgs.RevisionBefore,
		Targets:        commonArgs.Targets,
	}, nil
}
