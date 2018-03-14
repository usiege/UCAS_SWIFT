//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func appendQuery(url: String, key: String, value: AnyObject) -> String {
    func appendDictionary(url: String, key: String, value: AnyObject) -> String {
        return ""
    }
    func appendArray(url: String, key: String, value: AnyObject) -> String {
        return ""
    }
    func appendSingle(url: String, key: String, value: AnyObject) -> String {
        return ""
    }
    
    if let dic = value as? [String: AnyObject] {
        return appendDictionary(url: url, key: key, value: dic as AnyObject)
    } else if let array = value as? [AnyObject] {
        return appendArray(url: url, key: key, value: array as AnyObject)
    } else {
        return appendSingle(url: url, key: key, value: value)
    }
}

//返回一个函数
func makeIncrementor(addNumber: Int) -> ((inout Int) -> Void) {
    func incrementor(variable: inout Int) -> Void {
        variable += addNumber
    }
    return incrementor
}

















