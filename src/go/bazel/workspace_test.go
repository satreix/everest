package bazel

import (
	"testing"

	"github.com/google/go-cmp/cmp"
)

func Test_parseWorkspaceName(t *testing.T) {
	testCases := map[string]struct {
		content string
		want    string
	}{
		"one line": {
			content: `workspace(name = "rules_cc")

other rules
`,
			want: "rules_cc",
		},
		"multiple lines": {
			content: `workspace(
    name = "rules_cc",
)

other rules
`,
			want: "rules_cc",
		},
		"no name": {
			content: `other rules
`,
			want: "",
		},
	}

	for name, tc := range testCases {
		t.Run(name, func(t *testing.T) {
			got := ParseWorkspaceName(tc.content)
			if diff := cmp.Diff(tc.want, got); diff != "" {
				t.Errorf("parseWorkspaceName() mismatch (-want +got):\n%s", diff)
			}
		})
	}
}
