package main_test

import (
	"bytes"
	"fmt"
	"net"
	"os"
	"os/exec"
	"path/filepath"
	"reflect"
	"runtime"
	"strconv"
	"strings"
	"testing"

	"github.com/bazelbuild/rules_go/go/tools/bazel"
)

func TestEnd2End(t *testing.T) {
	const iface = "127.0.0.1"

	port, err := freeTCPPort("tcp", iface)
	if err != nil {
		t.Fatalf("could not get a free port: %s", err)
	}
	t.Logf("port: %d", port)

	serverBin, err := findBinary("//src/go/echo", "echo")
	if err != nil {
		t.Fatalf("error finding server: %s", err)
	}
	t.Log("server: " + serverBin)

	var serverStdout, serverStderr bytes.Buffer
	serverCmd := exec.Command(serverBin, fmt.Sprintf("-addr=%s", net.JoinHostPort(iface, strconv.Itoa(port))))
	serverCmd.Stdout = &serverStdout
	serverCmd.Stderr = &serverStderr
	if err := serverCmd.Start(); err != nil {
		t.Fatalf("error starting server: %s", err)
	}
	defer serverCmd.Process.Kill()

	clientBin, err := findBinary("//src/java/echo/client", "client")
	if err != nil {
		t.Fatalf("error finding client: %s", err)
	}
	t.Log("client: " + clientBin)

	var clientStdout, clientStderr bytes.Buffer
	clientCmd := exec.Command(clientBin, fmt.Sprintf("127.0.0.1:%d", port), "Java")
	clientCmd.Stdout = &clientStdout
	clientCmd.Stderr = &clientStderr

	if err := clientCmd.Run(); err != nil {
		t.Errorf("server out: %s", serverStdout.String())
		t.Errorf("server err: %s", serverStderr.String())
		t.Errorf("client out: %s", clientStdout.String())
		t.Errorf("client err: %s", clientStderr.String())
		t.Fatalf("error running client: %s", err)
	}

	actual := strings.TrimSpace(clientStdout.String())

	expected := "Hello Java"

	if !reflect.DeepEqual(actual, expected) {
		t.Fatalf("client error: expected=%#v, actual=%#v", expected, actual)
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
	for _, rf := range rfs {
		if rf.ShortPath == filepath.Join(pkg, name) {
			return rf.Path, nil
		}
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
