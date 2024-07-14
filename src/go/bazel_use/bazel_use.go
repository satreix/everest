package main

import (
	"context"
	"crypto/sha256"
	"errors"
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"os"
	"strings"

	"github.com/google/go-github/v63/github"
	"github.com/satreix/everest/src/go/bazel"
)

func main() {
	flag.Usage = func() {
		fmt.Fprintln(flag.CommandLine.Output(), "usage: bazel_use URI")
		flag.PrintDefaults()
	}
	flag.Parse()

	if flag.NArg() != 1 {
		fmt.Fprintln(flag.CommandLine.Output(), "error: missing URI")
		flag.Usage()
		os.Exit(1)
	}

	repo, err := parseRepository(flag.Arg(0))
	if err != nil {
		fmt.Fprintf(flag.CommandLine.Output(), "error: invalid URI %s", flag.Arg(0))
		flag.Usage()
		os.Exit(1)
	}

	gh := github.NewClient(nil)
	ctx := context.Background()
	releases, _, err := gh.Repositories.ListReleases(ctx, repo.Org, repo.Name, &github.ListOptions{})
	if err != nil {
		log.Fatalf("github error: %s", err)
	}

	if len(releases) == 0 {
		log.Fatalf("no releases found")
	}

	latestRelease := releases[0]

	name, err := computeName(ctx, gh, repo, latestRelease)
	if err != nil {
		log.Fatalf("error: %#v", err)
	}

	downloadURL := fmt.Sprintf("https://%s/%s/%s/archive/%s.tar.gz", repo.Host, repo.Org, repo.Name, latestRelease.GetTagName())
	stripPrefix := fmt.Sprintf("%s-%s", repo.Name, strings.TrimPrefix(latestRelease.GetTagName(), "v"))
	sha256, err := getSHA256(downloadURL)
	if err != nil {
		log.Fatalf("error: %#v", err)
	}

	fmt.Println(bazel.HTTPArchive{
		Name:        name,
		URL:         downloadURL,
		Sha256:      sha256,
		StripPrefix: stripPrefix,
	}.String())
}

func computeName(ctx context.Context, gh *github.Client, repo *repository, release *github.RepositoryRelease) (string, error) {
	var name string
	if cr, _, err := gh.Repositories.DownloadContents(ctx, repo.Org, repo.Name, "WORKSPACE", &github.RepositoryContentGetOptions{Ref: release.GetTagName()}); err == nil {
		workspaceFile, err := io.ReadAll(cr)
		if err != nil {
			return "", fmt.Errorf("workspace file read error: %w", err)
		}
		name = bazel.ParseWorkspaceName(string(workspaceFile))
	}
	if name == "" {
		name = fmt.Sprintf("com_github_%s_%s", repo.Org, repo.Name)
	}
	return name, nil
}

func getSHA256(url string) (string, error) {
	resp, err := http.Get(url)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	hash := sha256.Sum256(body)
	return fmt.Sprintf("%x", hash), nil
}

type repository struct {
	Host string
	Org  string
	Name string
}

func parseRepository(s string) (*repository, error) {
	uri, err := url.Parse(s)
	if err != nil {
		return nil, err
	}

	if uri.Host == "" {
		parts := strings.Split(s, "/")
		fmt.Fprintf(os.Stderr, "parts=%#v\n", parts)

		var path string
		if len(parts) == 1 {
			path = fmt.Sprintf("/bazelbuild/%s", parts[0])
		} else if len(parts) == 2 {
			path = fmt.Sprintf("/%s/%s", parts[0], parts[1])
		} else {
			return nil, fmt.Errorf("error: invalid URI: %s", s)
		}

		uri = &url.URL{
			Scheme: "https",
			Host:   "github.com",
			Path:   path,
		}
	}

	if uri.Host != "github.com" {
		return nil, errors.New("only github.com is supported (PR are welcome)")
	}

	pathParts := strings.Split(uri.Path, "/")
	repo := repository{
		Host: uri.Host,
		Org:  pathParts[1],
		Name: pathParts[2],
	}

	return &repo, nil
}
