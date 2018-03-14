//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
protocol Food {}
protocol Animal {
    func eat(_ food: Food)
    
    associatedtype F
    func eat(_ food: F)
}

struct Meat: Food {}
struct Grass: Food {}

struct Tiger: Animal {
    func eat(_ food: Food) {
        if let meat = food as? Meat {
            print("eat \(meat)")
        } else {
            fatalError("Tiger can only eat meat!")
        }
    }
    
    //错误的方法，无法通过编译
    //并不能等同于Animal中的方法
//    func eat(_ food: Meat) {
//        print("eat \(food)")
//    }
    
    typealias F = Meat
    func eat(_ food: Meat) {
        print("eat \(food)")
    }
    
    //protocol 'Animal' can only be used as a generic constraint because it has Self or associated type requirements
//    func isDangerous(animal: Animal) -> Bool {
//        return true
//    }

    func isDangerous<T: Animal>(animal: T) -> Bool {
        return true
    }
}

let meat = Meat()
Tiger().eat(meat)


