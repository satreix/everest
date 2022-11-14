package main

import (
	"context"
	"crypto/sha256"
	"crypto/sha512"
	"encoding/base64"
	"encoding/json"
	"flag"
	"fmt"
	"hash"
	"io"
	"log"
	"net/http"
	"strings"

	"github.com/google/go-github/v48/github"
)

type mapping map[string]string

func main() {
	flag.Parse()

	// FIXME parse a Github URL directly.
	parts := strings.Split(flag.Arg(0), "/")
	owner := parts[0]
	repo := parts[1]
	tag := flag.Arg(1)

	var m mapping
	if err := json.Unmarshal([]byte(flag.Arg(2)), &m); err != nil {
		log.Fatalf("error: invalid mapping: %s", err)
	}

	log.Printf("mapping=%#v", m)

	client := github.NewClient(nil)
	ctx := context.Background()
	release, _, err := client.Repositories.GetReleaseByTag(ctx, owner, repo, tag)
	if err != nil {
		log.Fatalf("error: could not get release: %s", err)
	}

	assets, err := listReleaseAssets(ctx, client, owner, repo, release.GetID())
	if err != nil {
		log.Fatalf("github error: %s", err)
	}

	for idx, asset := range assets {
		log.Printf("assets[%d]: name=%s url=%s", idx, asset.GetName(), asset.GetBrowserDownloadURL())

		sri, err := getSRI(ctx, asset.GetBrowserDownloadURL())
		if err != nil {
			log.Fatalf("hashing error: %s", err)
		}

		log.Printf("sri=%s", sri)
	}
}

func listReleaseAssets(ctx context.Context, client *github.Client, owner, repo string, releaseID int64) ([]*github.ReleaseAsset, error) {
	var allReleaseAssets []*github.ReleaseAsset
	opts := &github.ListOptions{PerPage: 25}
	for {
		assets, resp, err := client.Repositories.ListReleaseAssets(ctx, owner, repo, releaseID, opts)
		if err != nil {
			return nil, fmt.Errorf("github API error: %w", err)
		}
		allReleaseAssets = append(allReleaseAssets, assets...)
		if resp.NextPage == 0 {
			break
		}
		opts.Page = resp.NextPage
	}
	return allReleaseAssets, nil
}

var orderedHasher = []string{
	"sha256",
	"sha384",
	"sha512",
}

func getSRI(ctx context.Context, url string) (string, error) {
	resp, err := http.Get(url)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	hashers := map[string]hash.Hash{
		"sha256": sha256.New(),
		"sha384": sha512.New384(),
		"sha512": sha512.New(),
	}

	var ws []io.Writer
	for _, h := range hashers {
		ws = append(ws, h)
	}

	mw := io.MultiWriter(ws...)
	if _, err := io.Copy(mw, resp.Body); err != nil {
		return "", err
	}

	var out []string
	for _, name := range orderedHasher {
		out = append(out, fmt.Sprintf("%s-%s", name, base64.StdEncoding.EncodeToString(hashers[name].Sum(nil))))
	}

	return strings.Join(out, " "), nil
}
