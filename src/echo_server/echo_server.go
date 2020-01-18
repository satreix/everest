package main

import (
	"flag"
	"log"
	"net"
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

	buffer := make([]byte, 2048)
	size, err := conn.Read(buffer)
	if err != nil {
		log.Fatalf("Cannot read from the buffer: %s", err)
	}

	data := string(buffer[:size])
	log.Printf("Received data: %s", data)

	_, err = conn.Write([]byte("Echoed from Go: " + data))
	if err != nil {
		log.Fatalf("Failed to send data: %s", err)
	}
}
