package main

import (
	"encoding/json"
	"flag"
	"log"
	"net"

	"github.com/satreix/everest/src/echo_server/transmission_object"
)

func main() {
	addr := flag.String("addr", "127.0.0.1:1234", "address")
	flag.Parse()

	log.Print("Spinning up the Echo Server in Go...")

	ln, err := net.Listen("tcp", *addr)
	if err != nil {
		log.Fatalf("Unable to ln: %s", err)
	}
	defer ln.Close()

	log.Printf("Listenning on %s ...", *addr)

	conn, err := ln.Accept()
	if err != nil {
		log.Fatalf("Cannot accept a connection: %s", err)
	}
	defer conn.Close()

	log.Println("Receiving on a new connection")
	defer log.Println("Connection now closed.")

	var o transmission_object.TransmissionObject
	err = json.NewDecoder(conn).Decode(&o)
	if err != nil {
		log.Fatalf("Cannot unmarshal the buffer: %s", err)
	}

	log.Printf("Received data: %#v", o)

	err = json.NewEncoder(conn).Encode(&transmission_object.TransmissionObject{
		Message: "Echoed from Go: " + o.Message,
		Value:   o.Value,
	})
	if err != nil {
		log.Fatalf("Failed to marshall data: %s", err)
	}
}
