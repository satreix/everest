package main

import (
	"flag"
	"fmt"
	"log"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	giturls "github.com/whilp/git-urls"
)

func main() {
	flag.Parse()

	user, err := os.UserHomeDir()
	if err != nil {
		log.Fatalf("error getting user home directory: %s", err)
	}

	cloneDirBase := filepath.Join(user, "work/src")
	cloneURL, err := prepareCloneURL(flag.Arg(0))
	if err != nil {
		log.Fatalf("error parsing URI: %s", err)
	}

	ext := filepath.Ext(cloneURL.Path)
	name := strings.TrimSuffix(cloneURL.Path, ext)
	cloneDir := filepath.Join(cloneDirBase, name)

	if _, err := os.Stat(cloneDir); err != nil {
		if err := os.MkdirAll(filepath.Dir(cloneDir), 0o755); err != nil {
			log.Fatalf("error creating directory: %s", err)
		}

		if err := exec.Command("git", "clone", cloneURL.String(), cloneDir).Run(); err != nil {
			log.Fatalf("error cloning: %s", err)
		}
	}

	fmt.Println(cloneDir)
}

func prepareCloneURL(uri string) (*url.URL, error) {
	parts := strings.Split(uri, "/")
	if len(parts) == 2 {
		uri = "git@github.com:" + uri + ".git"
	}

	u, err := giturls.Parse(uri)
	if err != nil {
		log.Fatalf("error getting user home directory: %s", err)
	}

	switch u.Scheme {
	case "http", "https":
		return &url.URL{
			Scheme: "ssh",
			User:   url.User("git"),
			Host:   u.Host,
			Path:   u.Path,
		}, nil

	case "ssh":
		return u, nil

	default:
		return nil, fmt.Errorf("unsupported URI scheme: %s", u.Scheme)
	}
}
