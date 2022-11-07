use clap::Parser;

#[derive(Parser)]
struct Cli {
    #[arg(long)]
    name: Option<String>,
}

fn main() {
    let cli = Cli::parse();
    let name = cli.name.unwrap_or("World".to_string());
    println!("Hello, {}!", name);
}
