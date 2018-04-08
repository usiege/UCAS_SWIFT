//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let name = ["王小二","张三","李四","王小二"]

name.forEach {
    switch $0 {
    case let x where x.hasPerfix("王"):
        print("戏精")
    default:
        print("群众演员")
    }
}


/*********************************************/

struct Element {
    let name: String
}

indirect enum LinkedList<Element: Comparable> {
    case empty
    case node(Element, LinkedList<Element>)
}

func removing(_ element: Element) -> LinkedList<Element> {
    guard case let .node(value,next) = self else {
        return .empty
    }
    return (value == element ? next : LinkedList.node(value, next.removing(element)))
}
