//go:build tools

package nogo

// Pull in x/tools to force a recent version of it.
// Refs:
// - https://github.com/bazelbuild/rules_go/releases/tag/v0.43.0
// - https://github.com/bazelbuild/rules_go/commit/f2d409bc52d4945f283e89f8b501cbab65c83fbb
import _ "golang.org/x/tools/go/analysis"
