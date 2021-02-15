package src.java.hello_world;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

public class HelloWorld {
    private static CommandLine parseArgs(String[] args) {
        Options options = new Options();
        options.addOption(
                Option.builder()
                        .longOpt("name")
                        .argName("NAME")
                        .desc("name to great")
                        .hasArg()
                        .build());

        CommandLineParser parser = new DefaultParser();
        try {
            return parser.parse(options, args);
        } catch (ParseException e) {
            System.out.println(e.getMessage());
            HelpFormatter formatter = new HelpFormatter();
            formatter.printHelp("hello_world", options);
            System.exit(1);
        }

        return null;
    }

    public static void main(String[] args) {
        CommandLine cmd = parseArgs(args);
        String n = cmd.getOptionValue("name", "World");
        System.out.println("Hello, " + n + "!");
    }
}
