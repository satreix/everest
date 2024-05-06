#include <iostream>

#include "gflags/gflags.h"
#include <grpcpp/ext/proto_server_reflection_plugin.h>
#include <grpcpp/grpcpp.h>
#include <grpcpp/health_check_service_interface.h>

#include "src/proto/helloworld/helloworld.grpc.pb.h"
#include "src/cpp/hello_world/greet/greet.h"

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;
using helloworld::HelloReply;
using helloworld::HelloRequest;
using helloworld::Greeter;

DEFINE_string(address, "0.0.0.0:50051", "address to bind to");

class GreeterServiceImpl final : public Greeter::Service {
  Status SayHello(ServerContext      *context,
                  const HelloRequest *request,
                  HelloReply         *reply) override {
    reply->set_message(greet::greet(request->name()));
    return Status::OK;
  }
};

int
main(int argc, char **argv) {
  gflags::ParseCommandLineFlags(&argc, &argv, true);

  GreeterServiceImpl service;

  grpc::EnableDefaultHealthCheckService(true);
  grpc::reflection::InitProtoReflectionServerBuilderPlugin();
  ServerBuilder builder;
  builder.AddListeningPort(FLAGS_address, grpc::InsecureServerCredentials());
  builder.RegisterService(&service);
  std::unique_ptr<Server> server(builder.BuildAndStart());
  std::cerr << "Server listening on " << FLAGS_address << std::endl;
  server->Wait();
  return 0;
}
