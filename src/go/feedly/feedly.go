package main

import (
	"flag"
	"fmt"
	"log"
	"net/url"

	"github.com/gosuri/uiprogress"
	"github.com/pkg/browser"
)

func main() {
	log.Printf("getting config from keychain...")

	// TODO move to github.com/zalando/go-keyring
	userID, oauthToken, err := getConfig()
	if err != nil {
		panic(err)
	}

	countOnly := flag.Bool("count", false, "Get new count and return.")
	flag.Parse()

	f, err := NewFeedlyClient()
	if err != nil {
		log.Fatal(err)
	}

	f.AccessToken = oauthToken

	if *countOnly {
		count, err := f.GetSavedCount(userID)
		if err != nil {
			log.Fatal(err)
		}
		log.Printf("count: %d", count)
		return
	}

	ch, err := f.GetItems(userID)
	if err != nil {
		log.Fatal(err)
	}

	const count = 30

	uiprogress.Start()
	bar := uiprogress.AddBar(count)

	var d []string
	i := 0
	for item := range ch {
		d = append(d, url.QueryEscape(item.ID))

		if len(item.Alternate) < 1 {
			continue
		}

		_ = browser.OpenURL(item.Alternate[0].Href)
		i = i + 1

		bar.Incr()

		if i >= count {
			break
		}
	}

	uiprogress.Stop()

	if err := f.UntagEntries([]string{url.QueryEscape(fmt.Sprintf("user/%s/tag/global.saved", userID))}, d); err != nil {
		log.Fatal(err)
	}
}
