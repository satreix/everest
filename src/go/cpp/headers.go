package cpp

type header struct {
	introducedIn standard
	removedIn    *standard
}

func removed(s standard) *standard {
	return &s
}

func stdlibHeader(name string, s standard) bool {
	// stdlibHeaders is generated by bazel, see BUILD.bazel file.
	h, ok := stdlibHeaders[name]
	if !ok {
		return false
	}

	if !s.afterOrEqual(h.introducedIn) {
		return false
	}

	if h.removedIn != nil && !s.before(*h.removedIn) {
		return false
	}

	return true
}
