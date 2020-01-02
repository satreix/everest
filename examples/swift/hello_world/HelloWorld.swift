import Foundation
import Swift

let userDefaults = UserDefaults.standard
userDefaults.set("World", forKey: "name")
let name = userDefaults.string(forKey: "name")

print("Hello, \(name!)!")
