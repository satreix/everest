package bazel

import "fmt"

type HTTPArchive struct {
	Name        string
	URL         string
	Sha256      string
	StripPrefix string
}

func (a HTTPArchive) String() string {
	return fmt.Sprintf(`http_archive(
    name = "%s",
    sha256 = "%s",
    strip_prefix = "%s",
    url = "%s",
)`, a.Name, a.Sha256, a.StripPrefix, a.URL)
}
