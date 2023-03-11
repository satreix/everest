package bazel

import "regexp"

var workspaceRE = regexp.MustCompile(`(?m)workspace\(\s*name = "(.+)",?\s*\)`)

// ParseWorkspaceName parses the workspace name from the WORKSPACE content.
//
// It returns an empty string if not workspace name is found.
func ParseWorkspaceName(content string) string {
	for _, match := range workspaceRE.FindAllStringSubmatch(content, -1) {
		return match[1]
	}
	return ""
}
