extern crate clap;

fn main() {
    let matches = clap::Command::new("hello_world")
        .arg(
            clap::Arg::new("name")
                .long("name")
                .help("Name to great")
                .takes_value(true),
        )
        .get_matches();

    let name = matches.value_of("name").unwrap_or("World");
    println!("Hello, {}!", name);
}
