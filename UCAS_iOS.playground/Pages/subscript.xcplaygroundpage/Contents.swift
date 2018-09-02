//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var lll: Optional<Int> = Int(1)

class Class {
    static var name: String?
    subscript (index: Int) -> Int {
        get{
            return index * 100
        }
        set {
            
        }
    }
    subscript (string: String) -> String {
        return "this is a mutil subscript"
    }
//    private(set) var kk = 1;
}

var class1 = Class()
print(class1[1])
var class2 = Class()

Class.name = "111"
print(Class.name!)
