package main

import (
	"bytes"
	"flag"
	"github.com/mndrix/tap-go"
	"log"
	"math/rand"
	"os/exec"
	"time"
)

func main() {
	bin := flag.String("bin", "", "Binary")
	opt := flag.String("opt", "long", "Flag style")
	flag.Parse()

	t := tap.New()
	t.Header(2)

	rand.Seed(time.Now().UnixNano())

	optStyles := map[string]func(*exec.Cmd, string){
		"long":  func(cmd *exec.Cmd, name string) { cmd.Args = append(cmd.Args, "--name", name) },
		"short": func(cmd *exec.Cmd, name string) { cmd.Args = append(cmd.Args, "-name", name) },
	}

	nameOption, found := optStyles[*opt]
	if !found {
		log.Fatal("bad option style")
	}

	letterRunes := []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
	randStringRunes := func(n int) string {
		b := make([]rune, n)
		for i := range b {
			b[i] = letterRunes[rand.Intn(len(letterRunes))]
		}
		return string(b)
	}

	got, err := exec.Command(*bin).CombinedOutput()
	if err != nil {
		log.Fatalf("failed to execute binary: %s\n%s", err, got)
	}

	t.Ok(true, "default name")

	expected := []byte("Hello, World!\n")
	if !bytes.Equal(got, expected) {
		log.Fatalf("Sum was incorrect, got: %s, want: %s.", got, expected)
	}

	expectedName := randStringRunes(10)
	cmd := exec.Command(*bin)
	nameOption(cmd, expectedName)
	got, err = cmd.CombinedOutput()
	if err != nil {
		log.Fatalf("failed to execute binary: %s", err)
	}

	expected = []byte("Hello, " + expectedName + "!\n")
	if !bytes.Equal(got, expected) {
		log.Fatalf("Sum was incorrect, got: %s, want: %s.", got, expected)
	}

	t.Ok(true, "supplied name")
}
