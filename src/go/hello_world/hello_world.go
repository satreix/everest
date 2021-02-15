package main

import (
	"flag"
	"fmt"
)

func main() {
	name := flag.String("name", "World", "name to great")
	flag.Parse()

	fmt.Printf("Hello, %s!\n", *name)
}
