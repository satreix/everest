use helloworld_proto::helloworld::greeter_server::{Greeter, GreeterServer};
use helloworld_proto::helloworld::{HelloReply, HelloRequest};
use tonic::{transport::Server, Request, Response, Status};

#[derive(Default)]
struct GreeterImpl {}

#[tonic::async_trait]
impl Greeter for GreeterImpl {
    async fn say_hello(
        &self,
        request: Request<HelloRequest>,
    ) -> Result<Response<HelloReply>, Status> {
        let name = request.into_inner().name;
        let name = if name.trim().is_empty() {
            "World"
        } else {
            &name
        };

        Ok(Response::new(HelloReply {
            message: format!("Hello, {}!", name),
        }))
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let addr = "[::1]:50051".parse()?;
    let greeter = GreeterImpl::default();

    println!("GreeterServer listening on {}", addr);

    Server::builder()
        .add_service(GreeterServer::new(greeter))
        .serve(addr)
        .await?;

    Ok(())
}
