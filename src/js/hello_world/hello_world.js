const { Command } = require("commander");

function greet(name) {
    return "Hello, " + name + "!";
}

function main() {
    const program = new Command();
    program.option("-n, --name <string>", "", "World");
    program.parse();
    const options = program.opts();
    console.log(greet(options.name));
}

main();
