package main

import (
	"errors"
	"fmt"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/require"
)

func Test_getSHA256(t *testing.T) {
	const want = "68e656b251e67e8358bef8483ab0d51c6619f3e7a1a9f0e75838d41ff368f728"

	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.Write([]byte("hello, world!"))
	}))
	defer server.Close()

	got, err := getSHA256(server.URL)
	require.NoError(t, err)
	require.Equal(t, want, got)
}

func Test_parseRepository(t *testing.T) {
	testCases := map[string]struct {
		input     string
		want      *repository
		wantError error
	}{
		"valid URL": {
			input: "https://github.com/bazelbuild/bazel",
			want: &repository{
				Host: "github.com",
				Org:  "bazelbuild",
				Name: "bazel",
			},
		},
		"invalid URL": {
			input:     "https://example.com/foo/bar",
			wantError: errors.New("only github.com is supported (PR are welcome)"),
		},
		"malformed URL": {
			input:     "foo/bar/baz",
			wantError: fmt.Errorf("error: invalid URI: %s", "foo/bar/baz"),
		},
		"bazel repo": {
			input: "bar",
			want: &repository{
				Host: "github.com",
				Org:  "bazelbuild",
				Name: "bar",
			},
		},
		"github repo": {
			input: "foo/bar",
			want: &repository{
				Host: "github.com",
				Org:  "foo",
				Name: "bar",
			},
		},
	}

	for name, tc := range testCases {
		t.Run(name, func(t *testing.T) {
			got, err := parseRepository(tc.input)
			if tc.wantError == nil && err != nil {
				t.Fatalf("unexpected error: %v", err)
			}
			if tc.wantError != nil && (err == nil || err.Error() != tc.wantError.Error()) {
				t.Fatalf("unexpected error: %v", err)
			}
			if diff := cmp.Diff(tc.want, got); diff != "" {
				t.Errorf("parseRepository() mismatch (-want +got):\n%s", diff)
			}
		})
	}
}
