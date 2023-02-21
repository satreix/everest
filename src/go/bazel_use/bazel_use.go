package main

import (
	"context"
	"crypto/sha256"
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"os"
	"regexp"
	"strings"
	"text/template"

	"github.com/google/go-github/v50/github"
)

var workspaceRE = regexp.MustCompile(`(?m)workspace\(\s*name = "(.+)",?\s*\)`)

func main() {
	flag.Usage = func() {
		fmt.Fprintln(flag.CommandLine.Output(), "usage: bazel_use URI [REVISION]")
		flag.PrintDefaults()
	}
	flag.Parse()

	if flag.NArg() < 1 {
		fmt.Fprintln(flag.CommandLine.Output(), "error: missing URI")
		flag.Usage()
		os.Exit(1)
	}

	uri, err := url.Parse(flag.Arg(0))
	if err != nil {
		parts := strings.Split(flag.Arg(0), "/")
		log.Printf("parts=%#v", parts)

		var path string
		if len(parts) == 1 {
			path = fmt.Sprintf("/bazelbuild/%s", parts[0])
		} else if len(parts) == 2 {
			path = fmt.Sprintf("/%s/%s", parts[0], parts[1])
		} else {
			fmt.Fprintln(flag.CommandLine.Output(), "error: invalid URI %s", flag.Arg(0))
			flag.Usage()
			os.Exit(1)
		}

		uri = &url.URL{
			Scheme: "https",
			Host:   "github.com",
			Path:   path,
		}
	}

	if uri.Host != "github.com" {
		log.Fatal("only github.com is supported (PR are welcome)")
	}

	pathParts := strings.Split(uri.Path, "/")
	owner := pathParts[1]
	repo := pathParts[2]

	gh := github.NewClient(nil)

	ctx := context.Background()
	releases, _, err := gh.Repositories.ListReleases(ctx, owner, repo, &github.ListOptions{})
	if err != nil {
		log.Fatalf("github error: %s", err)
	}

	for _, release := range releases {
		var name string
		if cr, _, err := gh.Repositories.DownloadContents(ctx, owner, repo, "WORKSPACE", &github.RepositoryContentGetOptions{Ref: release.GetTagName()}); err == nil {
			workspaceFile, err := io.ReadAll(cr)
			if err != nil {
				log.Fatal("workspace file read error")
			}
			name = parseWorkspaceName(string(workspaceFile))
		}
		if name == "" {
			name = fmt.Sprintf("com_github_%s_%s", owner, repo)
		}

		downloadURL := fmt.Sprintf("https://github.com/bazelbuild/rules_cc/archive/%s.tar.gz", release.GetTagName())
		stripPrefix := fmt.Sprintf("%s-%s", repo, strings.TrimPrefix(release.GetTagName(), "v"))

		sha256, err := getSHA256(downloadURL)
		if err != nil {
			log.Fatalf("error: %#v", err)
		}

		if err := tpl.Execute(os.Stdout, &tplData{
			Name:        name,
			URL:         downloadURL,
			Sha256:      sha256,
			StripPrefix: stripPrefix,
		}); err != nil {
			log.Fatalf("template error: %s", err)
		}
		fmt.Fprintln(os.Stdout, "")
		return
	}

	log.Fatalf("could not find a release for the project")
}

var tpl = template.Must(template.New("").Parse(`http_archive(
    name = "{{.Name}}",
    sha256 = "{{.Sha256}}",
    strip_prefix = "{{.StripPrefix}}",
    url = "{{.URL}}",
)`))

type tplData struct {
	Name        string
	URL         string
	Sha256      string
	StripPrefix string
}

func parseWorkspaceName(content string) string {
	for _, match := range workspaceRE.FindAllStringSubmatch(content, -1) {
		return match[1]
	}
	return ""
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
