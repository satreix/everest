var name = "World"

if let nameIndex = CommandLine.arguments.firstIndex(of: "--name"), nameIndex + 1 < CommandLine.arguments.count {
    name = CommandLine.arguments[nameIndex + 1]
}

print("Hello, \(name)!") 
