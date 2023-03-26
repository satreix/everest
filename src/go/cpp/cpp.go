package cpp

type standard int

func (s standard) afterOrEqual(other standard) bool {
	return s >= other
}

func (s standard) before(other standard) bool {
	return !s.afterOrEqual(other)
}

const (
	standardCpp98 = iota
	standardCpp11
	standardCpp14
	standardCpp17
	standardCpp20
	standardCpp23
)
