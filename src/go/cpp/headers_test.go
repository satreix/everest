package cpp

import "testing"

func Test_stdlibHeader(t *testing.T) {
	tests := []struct {
		headerName string
		s          standard
		want       bool
	}{
		{headerName: "algorithm", s: standardCpp98, want: true},
		{headerName: "algorithm", s: standardCpp17, want: true},
		{headerName: "codecvt", s: standardCpp98, want: false},
		{headerName: "codecvt", s: standardCpp11, want: true},
		{headerName: "codecvt", s: standardCpp17, want: false},
		{headerName: "doesnotexist", s: standardCpp23, want: false},
	}
	for _, tt := range tests {
		t.Run("", func(t *testing.T) {
			if got := stdlibHeader(tt.headerName, tt.s); got != tt.want {
				t.Errorf("stdlibHeader() = %v, want %v", got, tt.want)
			}
		})
	}
}
