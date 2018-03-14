//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)
typealias Location = CGPoint
typealias Distance = Double

func distance(from location: Location, to anotherLocation: Location) -> Distance {
    return 0.0
}

let location = Location(x: 0, y: 0)
let distance = Distance(exactly: 0)

//泛型
class Person<T> {}
typealias Worker<T> = Person<T>

//协议组合
protocol Cat {}
protocol Dog {}
typealias Pat = Cat & Dog


