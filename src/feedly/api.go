package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"os"
	"strings"
	"time"
)

const (
	ProductionHost         = "https://cloud.feedly.com"
	MaximumItemsPerRequest = 10000
)

type FeedlyClient struct {
	http.Client

	Host        string
	AccessToken string
}

func NewFeedlyClient() (*FeedlyClient, error) {
	return &FeedlyClient{
		Host: ProductionHost,
	}, nil
}

func (c *FeedlyClient) GetSavedCount(userID string) (int, error) {
	streamID := fmt.Sprintf("user/%s/tag/global.saved", url.QueryEscape(userID))

	var continuation string
	count := 0
	for {
		options := map[string]string{}
		if continuation != "" {
			options["continuation"] = continuation
		}

		u, err := c.IdsStreamURL(streamID, options)
		if err != nil {
			log.Fatal(err)
		}
		log.Printf("url: %#v", u)

		req, err := http.NewRequest("GET", u, nil)
		if err != nil {
			log.Fatal(err)
		}

		res, err := c.Do(req)
		if err != nil {
			log.Fatal(err)
		}

		var r StreamIdsResponse
		err = json.NewDecoder(res.Body).Decode(&r)
		if err != nil {
			log.Fatal(err)
		}

		res.Body.Close()
		if r.ErrorCode == 429 {
			log.Printf("API rate limit: %s", r.ErrorMessage)
			time.Sleep(5 * time.Second)
			continue
		}

		if r.ErrorCode != 0 {
			log.Fatal(r.ErrorMessage)
		}

		count += len(r.Ids)
		log.Printf("count: %d", count)

		if r.Continuation == "" {
			break
		}

		continuation = r.Continuation
	}

	return count, nil
}

func (c *FeedlyClient) Do(req *http.Request) (*http.Response, error) {
	req.Header.Set("Authorization", fmt.Sprintf("OAuth %s", c.AccessToken))
	return c.Client.Do(req)
}

func (c *FeedlyClient) UntagEntries(tags, entries []string) error {
	uri := fmt.Sprintf("%s/v3/tags/%s/%s", c.Host, strings.Join(tags, ","), strings.Join(entries, ","))
	req, err := http.NewRequest("DELETE", uri, nil)
	if err != nil {
		return err
	}

	res, err := c.Do(req)
	if err != nil {
		return err
	}

	if res.StatusCode != 200 {
		defer res.Body.Close()
		_, err := io.Copy(os.Stdout, res.Body)
		if err != nil {
			return err
		}

		return errors.New("res.StatusCode != 200")
	}

	return nil
}

func (c *FeedlyClient) IdsStreamURL(streamID string, options map[string]string) (string, error) {
	u, err := url.Parse(fmt.Sprintf("%s/v3/streams/ids", c.Host))
	if err != nil {
		return "", err
	}

	q := u.Query()
	q.Set("streamId", streamID)
	q.Set("count", fmt.Sprintf("%d", MaximumItemsPerRequest))

	for k, v := range options {
		q.Set(k, v)
	}

	u.RawQuery = q.Encode()
	return u.String(), nil
}

func (c *FeedlyClient) GetItems(userID string) (chan StreamContentResponseItem, error) {
	out := make(chan StreamContentResponseItem)

	streamID := fmt.Sprintf("user/%s/tag/global.saved", url.QueryEscape(userID))

	go func(out chan StreamContentResponseItem) {
		var continuation string
		for {
			options := map[string]string{}
			if continuation != "" {
				options["continuation"] = continuation
			}

			u, err := c.ContentStreamURL(streamID, options)
			if err != nil {
				log.Printf("Error: %s", err)
				break
			}
			log.Printf("url: %#v", u)

			req, err := http.NewRequest("GET", u, nil)
			if err != nil {
				log.Printf("Error: %s", err)
				break
			}

			res, err := c.Do(req)
			if err != nil {
				log.Printf("Error: %s", err)
				break
			}

			var r StreamContentResponse
			err = json.NewDecoder(res.Body).Decode(&r)
			if err != nil {
				log.Printf("Error: %s", r.ErrorMessage)
				break
			}
			res.Body.Close()

			if r.ErrorCode != 0 {
				log.Printf("Error: %s", r.ErrorMessage)
				break
			}

			for _, item := range r.Items {
				out <- item
			}

			if r.Continuation == "" {
				break
			}

			continuation = r.Continuation
		}

		close(out)
	}(out)

	return out, nil
}

func (c *FeedlyClient) ContentStreamURL(streamID string, options map[string]string) (string, error) {
	u, err := url.Parse(fmt.Sprintf("%s/v3/streams/contents", c.Host))
	if err != nil {
		return "", err
	}

	q := u.Query()
	q.Set("streamId", streamID)
	q.Set("count", fmt.Sprintf("%d", MaximumItemsPerRequest))

	for k, v := range options {
		q.Set(k, v)
	}

	u.RawQuery = q.Encode()
	return u.String(), nil
}

type FeedlyResponse struct {
	ErrorCode    int    `json:"errorCode"`
	ErrorID      string `json:"errorId"`
	ErrorMessage string `json:"errorMessage"`
}

type StreamIdsResponse struct {
	FeedlyResponse

	Ids          []string `json:"ids"`
	Continuation string   `json:"continuation"`
}

type StreamContentResponseItem struct {
	Updated int64  `json:"updated"`
	ID      string `json:"id"`
	Title   string `json:"title"`
	Unread  bool   `json:"unread"`
	Content struct {
		Content   string `json:"content"`
		Direction string `json:"direction"`
	} `json:"content"`
	Origin struct {
		HTMLURL  string `json:"htmlUrl"`
		Title    string `json:"title"`
		StreamID string `json:"streamId"`
	} `json:"origin"`
	Author     string `json:"author"`
	Categories []struct {
		ID    string `json:"id"`
		Label string `json:"label"`
	} `json:"categories"`
	Crawled    int64 `json:"crawled"`
	Engagement int   `json:"engagement"`
	Alternate  []struct {
		Href string `json:"href"`
		Type string `json:"type"`
	} `json:"alternate"`
	Tags []struct {
		ID    string `json:"id"`
		Label string `json:"label"`
	} `json:"tags"`
	Published int64 `json:"published"`
}

type StreamContentResponse struct {
	FeedlyResponse

	Updated      int64                       `json:"updated"`
	ID           string                      `json:"id"`
	Title        string                      `json:"title"`
	Continuation string                      `json:"continuation"`
	Items        []StreamContentResponseItem `json:"items"`
	Alternate    []struct {
		Href string `json:"href"`
		Type string `json:"type"`
	} `json:"alternate"`
	Self []struct {
		Href string `json:" href"`
	} `json:"self"`
	Direction string `json:"direction"`
}
