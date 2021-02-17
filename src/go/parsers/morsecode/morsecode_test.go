package morsecode

import (
	"testing"

	"github.com/google/go-cmp/cmp"
)

func TestParse(t *testing.T) {
	tests := map[string]struct {
		input   string
		want    string
		wantErr bool
	}{
		"SOS": {
			input: "... --- ...",
			want:  "(morsecode (letter (s . . .))   (letter (o - - -))   (letter (s . . .)))",
		},
		"Bad input": {
			input:   "This is not morse",
			wantErr: true,
		},
	}

	for name, tt := range tests {
		t.Run(name, func(t *testing.T) {
			got, err := Parse(tt.input)
			if (err != nil) != tt.wantErr {
				t.Fatalf("Parse() error = %v, wantErr %v", err, tt.wantErr)
			}
			if diff := cmp.Diff(got, tt.want); diff != "" {
				t.Fatalf("Parse() differs: (-got +want)\n%s", diff)
			}
		})
	}
}
