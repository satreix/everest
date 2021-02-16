# Client side load balancing in gRPC

This demo uses Consul as a service registry for the service instances.

## Tools

- https://github.com/jpmens/jo JSON output from a shell
- https://github.com/fullstorydev/grpcurl cURL for gRPC servers

## Usage

Start consul:

```bash
rm -rf /tmp/consul1
consul agent -bootstrap -data-dir=/tmp/consul1 -dev -ui
```

Open the UI: http://localhost:8500

Start some backends:

```bash
bazel build //src/go/grpc/clientsidelb/server
bazel-bin/src/go/grpc/clientsidelb/server/server_/server --addr 127.0.0.1:50051 --hostname srv1
bazel-bin/src/go/grpc/clientsidelb/server/server_/server --addr 127.0.0.1:50052 --hostname srv2
bazel-bin/src/go/grpc/clientsidelb/server/server_/server --addr 127.0.0.1:50053 --hostname srv3
```

Start the client:

```bash
bazel run //src/go/grpc/clientsidelb/client -- --addr 'consul://127.0.0.1:8500/helloworld.Greeter?healthy=true'
```

The client will loop forever. The RPCs will be load balanced to the healthy
backends.

## Demo lines

```bash
grpcurl -plaintext localhost:50052 list
grpcurl -plaintext localhost:50052 describe helloworld.HelloRequest

jo 'name=satreix' | grpcurl -plaintext -d @ localhost:50052 helloworld.Greeter/SayHello
jo 'name=health:down' | grpcurl -plaintext -d @ localhost:50052 helloworld.Greeter/SayHello
jo 'name=health:up' | grpcurl -plaintext -d @ localhost:50052 helloworld.Greeter/SayHello

jo name=satreix | grpcurl -plaintext -d @ localhost:50052 helloworld.Greeter/SayHello

grpc-health-probe -addr 127.0.0.1:50052 -service 'helloworld.Greeter'
```

## Reference

- https://github.com/grpc/grpc/blob/master/doc/service_config.md
- https://github.com/grpc/grpc-proto/blob/master/grpc/service_config/service_config.proto
