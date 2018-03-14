//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//同一个target里的类型名称是不能相同的，也就是一个target是一个module
//一个framework是一个命名空间

public class MyClassInFramework {
    public class func hello() {
        
    }
}

class MyClassInApp {
    class func hello() {
        
    }
}

/*Framework.*/MyClassInFramework.hello()
MyClassInApp.hello()

struct MyClass1 {
    class MyClass {
        class func hello() {
            
        }
    }
}

struct MyClass2 {
    class MyClass {
        class func hello() {
            
        }
    }
}

MyClass1.MyClass.hello()
MyClass2.MyClass.hello()






