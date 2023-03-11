package bazel

import (
	"github.com/google/go-cmp/cmp"
	"testing"
)

func TestHTTPArchive_String(t *testing.T) {
	const want = `http_archive(
    name = "a",
    sha256 = "c",
    strip_prefix = "d",
    url = "b",
)`
	a := HTTPArchive{
		Name:        "a",
		URL:         "b",
		Sha256:      "c",
		StripPrefix: "d",
	}
	got := a.String()
	if diff := cmp.Diff(want, got); diff != "" {
		t.Errorf("HTTPArchive.String() mismatch (-want +got):\n%s", diff)
	}
}
