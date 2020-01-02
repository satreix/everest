import org.apache.commons.cli.*;

public class HelloWorld {
    public static void main(String[] args) {
        CommandLine cmd = parseArgs(args);

        String n = cmd.getOptionValue("name", "World");
        System.out.println("Hello, " + n + "!");
    }

    private static CommandLine parseArgs(String[] args) {
        Option name =
                OptionBuilder.withArgName("name")
                        .hasArg()
                        .withDescription("name to great")
                        .create("name");

        Options options = new Options();
        options.addOption(name);

        CommandLineParser parser = new DefaultParser();

        try {
            CommandLine cmd = parser.parse(options, args);
            return cmd;
        } catch (ParseException e) {
            System.out.println(e.getMessage());
            HelpFormatter formatter = new HelpFormatter();
            formatter.printHelp("hello_world", options);
            System.exit(1);
        }

        return null;
    }
}
