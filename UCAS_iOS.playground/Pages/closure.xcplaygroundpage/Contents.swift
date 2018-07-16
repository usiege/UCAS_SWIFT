//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

class Pokemon: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Pokemon \(name)"
    }
    
    let name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(self) escaped!")
    }
}


