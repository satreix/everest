package cpp

import "testing"

func Test_standard_afterOrEqual(t *testing.T) {
	tests := []struct {
		s, other standard
		want     bool
	}{
		{s: standardCpp98, other: standardCpp17, want: false},
		{s: standardCpp98, other: standardCpp98, want: true},
		{s: standardCpp98, other: standardCpp98, want: true},
		{s: standardCpp11, other: standardCpp98, want: true},
	}
	for _, tt := range tests {
		t.Run("", func(t *testing.T) {
			if got := tt.s.afterOrEqual(tt.other); got != tt.want {
				t.Errorf("afterOrEqual() = %v, want %v", got, tt.want)
			}
		})
	}
}

func Test_standard_before(t *testing.T) {
	tests := []struct {
		s, other standard
		want     bool
	}{
		{s: standardCpp98, other: standardCpp17, want: true},
		{s: standardCpp98, other: standardCpp98, want: false},
		{s: standardCpp11, other: standardCpp98, want: false},
	}
	for _, tt := range tests {
		t.Run("", func(t *testing.T) {
			if got := tt.s.before(tt.other); got != tt.want {
				t.Errorf("before() = %v, want %v", got, tt.want)
			}
		})
	}
}
