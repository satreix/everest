// examples/objc/hello_world/Sources/Hello
import Hello

let userDefaults = UserDefaults.standard
userDefaults.set("World", forKey: "name")
let name = userDefaults.string(forKey: "name")

hello(name)
