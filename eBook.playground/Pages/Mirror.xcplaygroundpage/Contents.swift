//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

struct Person {
    let name: String
    let age: Int
}

let xiaoMing = Person(name: "xiao ming", age: 16)
let r = Mirror(reflecting: xiaoMing)

print("xiaoming is \(r.displayStyle!)")
print("count is \(r.children.count)")

for child in r.children {
    print("name is \(String(describing: child.label)), value is \(child.value)")
}

dump(xiaoMing)

var lll: String! = nil
lll!.startIndex
