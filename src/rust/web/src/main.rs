extern crate iron;
extern crate iron_slog;
extern crate router;
#[macro_use]
extern crate slog;
extern crate slog_async;
extern crate slog_term;

use askama::Template;
use iron::prelude::*;
use iron::{status};
use iron::headers::ContentType;
use iron_slog::{LoggerMiddleware, DefaultLogFormatter};
use router::Router;
use slog::{Drain, Logger};

#[derive(Template)]
#[template(path = "hello.html")]
struct HelloTemplate<'a> {
    name: &'a str,
}

fn hello(_: &mut Request) -> IronResult<Response> {
    let name = "World";
    let hello = HelloTemplate { name };

    Ok(Response::with((
        ContentType::html().0,
        status::Ok,
        hello.render().unwrap(),
    )))
}

fn main() {
    let addr = "localhost:3000";

    let decorator = slog_term::TermDecorator::new().build();
    let drain = slog_term::CompactFormat::new(decorator).build().fuse();
    let drain = slog_async::Async::new(drain).build().fuse();
    let logger = Logger::root(drain, o!());

    let formatter = DefaultLogFormatter;

    let mut router = Router::new();
    router.get("/", hello, "hello");

    info!(logger, "server listening"; "addr" => format!("http://{}", addr));
    let handler = LoggerMiddleware::new(router, logger, formatter);

    
    Iron::new(handler).http(addr).unwrap();
}
