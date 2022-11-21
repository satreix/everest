const { program } = require('commander');

program
  .option('--name <string>');

program.parse();

function greet(name) {
    return 'Hello, ' + name + '!';
}

function main() {
    program.option('-n, --name <string>', '', 'World');
    program.parse();
    const options = program.opts();
    console.log(greet(options.name));
}

main();
