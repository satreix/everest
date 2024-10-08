package main

import (
	"encoding/csv"
	"flag"
	"fmt"
	"log"
	"os"
)

func main() {
	flag.Parse()

	f, err := os.Open(flag.Arg(0))
	if err != nil {
		log.Fatalf("cannot open csv: %s", err)
	}
	defer f.Close()

	csvreader := csv.NewReader(f)
	_, err = csvreader.Read()
	if err != nil {
		panic(err)
	}

	fmt.Println("// Code generated by gen; DO NOT EDIT.")
	fmt.Println("package cpp")
	fmt.Println("")
	fmt.Println("var stdlibHeaders = map[string]header{")

	for {
		row, err := csvreader.Read()
		if err != nil {
			if err.Error() == "EOF" {
				break
			}
			panic(err)
		}

		introducedIn, err := parseStandard(row[1])
		if err != nil {
			log.Fatalf("%s", err.Error())
		}
		fmt.Printf("\t\"%s\": {introducedIn: %s", row[0], introducedIn)
		if row[2] != "" {
			removedIn, err := parseStandard(row[2])
			if err != nil {
				log.Fatalf("%s", err.Error())
			}
			fmt.Printf(", removedIn: removed(%s)", removedIn)
		}
		fmt.Printf("},\n")
	}

	fmt.Println("}")
}

var standards = map[string]string{
	"C++98": "standardCpp98",
	"C++11": "standardCpp11",
	"C++14": "standardCpp14",
	"C++17": "standardCpp17",
	"C++20": "standardCpp20",
	"C++23": "standardCpp23",
}

func parseStandard(s string) (string, error) {
	st, ok := standards[s]
	if !ok {
		return "", fmt.Errorf("unknown C++ standard: %s", s)
	}
	return st, nil
}
