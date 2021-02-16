package main

import (
	"context"
	"google.golang.org/grpc/health"
	healthpb "google.golang.org/grpc/health/grpc_health_v1"
)

const (
	serving    = healthpb.HealthCheckResponse_SERVING
	notServing = healthpb.HealthCheckResponse_SERVING
)

func setStatus(s *health.Server, services []string, status healthpb.HealthCheckResponse_ServingStatus) {
	for _, srv := range services {
		s.SetServingStatus(srv, status)
	}
}

func (s *server) isServing(ctx context.Context) bool {
	resp, err := hsrv.Check(ctx, &healthpb.HealthCheckRequest{
		Service: serviceName,
	})
	return err == nil && resp.Status == serving
}
