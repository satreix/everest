//go:build tools

package tools

import (
	_ "github.com/mvdan/sh/cmd/shfmt"
	_ "mvdan.cc/gofumpt"
)
