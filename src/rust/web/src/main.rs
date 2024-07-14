#[macro_use]
extern crate slog;
extern crate slog_async;
extern crate slog_term;

use askama_warp::Template;
use slog::{Drain, Logger};
use std::net::SocketAddr;
use warp::Filter;

#[derive(Template)]
#[template(path = "hello.html")]
struct HelloTemplate {
    name: String,
}

fn setup_route() -> impl Filter<Extract = impl warp::Reply, Error = warp::Rejection> + Clone {
    let hello_world = warp::path!("greet").map(|| HelloTemplate {
        name: "World".to_string(),
    });
    let hello = warp::path!("greet" / String).map(|name| HelloTemplate { name });

    warp::get().and(hello_world.or(hello))
}

#[tokio::main]
async fn main() {
    let addr_str = "127.0.0.1:3000";
    let addr: SocketAddr = addr_str.parse().expect("Unable to parse socket address");

    let decorator = slog_term::TermDecorator::new().build();
    let drain = slog_term::CompactFormat::new(decorator).build().fuse();
    let drain = slog_async::Async::new(drain).build().fuse();
    let logger = Logger::root(drain, o!());

    info!(logger, "server listening"; "addr" => format!("http://{}", addr_str));

    let routes = setup_route();
    warp::serve(routes).run(addr).await;
}

#[cfg(test)]
mod tests {
    use super::*;
    use warp::http::StatusCode;

    #[tokio::test]
    async fn test_hello() {
        let routes = setup_route();
        let res = warp::test::request().path("/greet").reply(&routes).await;
        assert_eq!(res.status(), StatusCode::OK);
        let body = std::str::from_utf8(res.body()).expect("response was not valid UTF-8");
        assert!(body.contains("Hello, World!"));
    }

    #[tokio::test]
    async fn test_hello_handler() {
        let routes = setup_route();
        let res = warp::test::request()
            .path("/greet/rust")
            .reply(&routes)
            .await;
        assert_eq!(res.status(), StatusCode::OK);
        let body = std::str::from_utf8(res.body()).expect("response was not valid UTF-8");
        assert!(body.contains("Hello, rust!"));
    }
}
