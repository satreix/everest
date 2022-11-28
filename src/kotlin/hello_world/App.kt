package hello_world

class App {
    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            var name: String = "World"
            if (!args.isEmpty()) {
                name = args[1]
            }

            println("Hello, $name!")
        }
    }
}
