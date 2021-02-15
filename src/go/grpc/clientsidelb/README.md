# Client side load balancing in gRPC

This demo uses Consul as a service registry for the service instances.

## Usage

Start consul:

```bash
consul agent -bootstrap -data-dir=/tmp/consul1 -dev -ui
```

Open the UI: http://localhost:8500

Start some backends:

```bash
server --addr 127.0.0.1:50051 --hostname srv1
server --addr 127.0.0.1:50052 --hostname srv2
server --addr 127.0.0.1:50053 --hostname srv3
```

Start the client:

```bash
bazel run //src/go/grpc/clientsidelb/client -- --addr consul://127.0.0.1:8500/helloworld.Greeter
```

The client will loop forever, and the call will be load-balanced to the backends.
