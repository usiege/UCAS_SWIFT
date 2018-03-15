//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func sum(input: Int...) -> Int {
    return input.reduce(0, +)
}

print(sum(input: 1,2,3,4))

//同一方法中只能有一个参数是可变的；
//必须是同一种类型
let a = 0
NSString.init(format: "%d", a)

//CVarArg

