//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
class Cat {
    var name: String
    init() {
        name = "cat"
        print(name)
    }
}

class Tiger: Cat {
    let power: Int
//    print(name)
    override init() {
        power = 10
        super.init()
        name = "tiger"
        print(name)
    }
}

let tiger = Tiger.init()

//Designated Convenience Required
class ClassA {
    let numA: Int
    init(num: Int) {
        numA = num
        numT = 0.0
    }
    
    convenience init(bigNum: Bool) {
        self.init(num: bigNum ? 10000: 1 )
    }
    
    let numT: Float
    required init(num: Float) {
        numT = num
        numA = 0
    }
}

class ClassB: ClassA {
    let numB: Int
    override init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
    
    required init(num: Float) {
        numB = Int(num + 1)
        super.init(num: num)
        fatalError("init(num:) has not been implemented")
    }
}

                                                                                                                                                                                                                                                                                                                                                                        






