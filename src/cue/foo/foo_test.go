package main

import (
	"encoding/json"
	"os"
	"testing"
)

type Foo struct {
	Message string
}

func TestCueExport(t *testing.T) {
	f, err := os.Open("foo_export.json")
	if err != nil {
		t.Fatalf("%s", err)
	}
	defer f.Close()

	var o Foo
	if err := json.NewDecoder(f).Decode(&o); err != nil {
		t.Fatalf("%s", err)
	}

	got := o.Message
	want := "Hello, CUE!"
	if o.Message != want {
		t.Fatalf("unexpected message: got %#v, want %#v", got, want)
	}
}
