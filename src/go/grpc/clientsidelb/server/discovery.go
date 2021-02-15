package main

import (
	"fmt"
	consulapi "github.com/hashicorp/consul/api"
	"log"
	"math/rand"
	"net"
	"strconv"
	"time"
)

func discoverService(serviceName, addr string) (execute func() error, interrupt func(error), err error) {
	host, p, err := net.SplitHostPort(addr)
	if err != nil {
		return nil, nil, err
	}

	port, err := strconv.Atoi(p)
	if err != nil {
		return nil, nil, err
	}

	client, err := consulapi.NewClient(consulapi.DefaultConfig())
	if err != nil {
		return nil, nil, err
	}

	rand.Seed(time.Now().UnixNano())
	serviceID := fmt.Sprintf("%s-%03d", serviceName, rand.Int()%100)

	execute = func() error {
		log.Printf("disco: register service %s ...", serviceID)
		return client.Agent().ServiceRegister(&consulapi.AgentServiceRegistration{
			ID:      serviceID,
			Name:    serviceName,
			Tags:    nil,
			Port:    port,
			Address: host,
		})
	}

	interrupt = func(error) {
		log.Printf("disco: deregister service %s ...", serviceID)
		if err := client.Agent().ServiceDeregister(serviceID); err != nil {
			log.Printf("disco: deregister error: %s", err)
		}
	}

	return execute, interrupt, nil
}
