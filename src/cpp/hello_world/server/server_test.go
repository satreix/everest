package main_test

import (
	"context"
	"fmt"
	"log"
	"net"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	"github.com/bazelbuild/rules_go/go/tools/bazel"
	"github.com/satreix/everest/src/proto/helloworld"
	"google.golang.org/grpc"
)

func TestEnd2End(t *testing.T) {
	const iface = "127.0.0.1"
	port, err := freeTCPPort("tcp", iface)
	if err != nil {
		t.Fatalf("could not get a free port: %s", err)
	}
	addr := fmt.Sprintf("%s:%d", iface, port)
	t.Logf("addr: %s", addr)

	serverBin, err := findBinary("//src/cpp/hello_world/server", "server")
	if err != nil {
		t.Fatalf("error finding server: %s", err)
	}
	t.Log("server: " + serverBin)

	serverCmd := exec.Command(serverBin, fmt.Sprintf("--address=%s", addr))
	if err := serverCmd.Start(); err != nil {
		t.Fatalf("error starting server: %s", err)
	}
	defer serverCmd.Process.Kill()
	t.Logf("serverCmd: %s", strings.Join(serverCmd.Args, " "))

	// FIXME make this not time based but instead retry the assertion
	time.Sleep(2 * time.Second)

	conn, err := grpc.Dial(addr, grpc.WithInsecure())
	if err != nil {
		t.Fatalf("Failed to connect: %v", err)
	}
	defer conn.Close()

	client := helloworld.NewGreeterClient(conn)

	resp, err := client.SayHello(context.Background(), &helloworld.HelloRequest{
		Name: "Alice",
	})
	if err != nil {
		t.Fatalf("SayHello failed: %v", err)
	}

	expectedMessage := "Hello, Alice!"
	if resp.Message != expectedMessage {
		t.Fatalf("Unexpected response: got %q, want %q", resp.Message, expectedMessage)
	}
}

func findBinary(pkg, name string) (string, error) {
	// workaround for external targets
	if strings.HasPrefix(pkg, "@") {
		pkg = "external/" + strings.TrimPrefix(pkg, "@")
	}
	pkg = strings.TrimPrefix(pkg, "//")

	rfs, err := bazel.ListRunfiles()
	if err != nil {
		return "", err
	}
	for idx, rf := range rfs {
		if rf.ShortPath == filepath.Join(pkg, name) {
			return rf.Path, nil
		}

		log.Printf("%d. %#v", idx, rf)
	}

	bin, found := bazel.FindBinary(pkg, name)
	if !found {
		return "", fmt.Errorf("couldn't find binary for %s:%s", pkg, name)
	}

	fi, err := os.Stat(bin)
	if err != nil {
		panic(err.Error())
	}

	if fi.Mode().IsDir() {
		return bin + "/" + runtime.GOOS + "_" + runtime.GOARCH + "_stripped/" + name, nil
	}

	return bin, nil
}

func freeTCPPort(network, iface string) (int, error) {
	l, err := net.Listen(network, iface+":0")
	if err != nil {
		return 0, err
	}
	defer l.Close()

	return l.Addr().(*net.TCPAddr).Port, nil
}
