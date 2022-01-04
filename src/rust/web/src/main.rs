extern crate iron;
extern crate iron_slog;
extern crate iron_test;
extern crate router;
#[macro_use]
extern crate slog;
extern crate slog_async;
extern crate slog_term;

use askama::Template;
use iron::headers::ContentType;
use iron::prelude::*;
use iron::status;
use iron_slog::{DefaultLogFormatter, LoggerMiddleware};
use router::Router;
use slog::{Drain, Logger};

#[derive(Template)]
#[template(path = "hello.html")]
struct HelloTemplate<'a> {
    name: &'a str,
}

fn hello(req: &mut Request) -> IronResult<Response> {
    let name = req
        .extensions
        .get::<Router>()
        .unwrap()
        .find("name")
        .unwrap_or("World");
    let hello = HelloTemplate { name };

    Ok(Response::with((
        ContentType::html().0,
        status::Ok,
        hello.render().unwrap(),
    )))
}

fn app_router() -> Router {
    let mut router = Router::new();
    router.get("/", hello, "hello");
    router.get("/:name", hello, "hello_name");
    router
}

fn main() {
    let addr = "localhost:3000";

    let decorator = slog_term::TermDecorator::new().build();
    let drain = slog_term::CompactFormat::new(decorator).build().fuse();
    let drain = slog_async::Async::new(drain).build().fuse();
    let logger = Logger::root(drain, o!());

    let formatter = DefaultLogFormatter;

    info!(logger, "server listening"; "addr" => format!("http://{}", addr));
    let handler = LoggerMiddleware::new(app_router(), logger, formatter);

    Iron::new(handler).http(addr).unwrap();
}

#[cfg(test)]
mod tests {
    use super::app_router;
    use iron::Headers;
    use iron_test::{request, response};
    use std::str;

    #[test]
    fn test_hello() {
        let response = request::get("http://localhost:3000/", Headers::new(), &app_router());
        let result_body = response::extract_body_to_bytes(response.unwrap());
        assert!(str::from_utf8(&result_body)
            .unwrap()
            .contains("Hello, World!"));
    }

    #[test]
    fn test_hello_handler() {
        let response = request::get("http://localhost:3000/rust", Headers::new(), &app_router());
        let result_body = response::extract_body_to_bytes(response.unwrap());
        assert!(str::from_utf8(&result_body)
            .unwrap()
            .contains("Hello, rust!"));
    }
}
