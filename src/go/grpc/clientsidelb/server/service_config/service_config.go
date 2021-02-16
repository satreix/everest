package service_config

// ServiceConfigJSON returns a JSON encoded gRPC service configuration.
//
// In a full blow deployment, this should be distributed using the client gRPC
// resolver.
func ServiceConfigJSON() string {
	// See all the available options in
	// https://github.com/grpc/grpc-proto/blob/master/grpc/service_config/service_config.proto
	return `{"loadBalancingPolicy":"round_robin"}`
}
