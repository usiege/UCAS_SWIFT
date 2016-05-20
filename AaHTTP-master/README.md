# AaHTTP
AaHTTP - Simple, lightweighted, elegant HTTP request encapsulatation in Swift.   

## Features

- **D**esigned for trivial app network scenario. (JSON based GET/POST request)
- **P**urely implemented with NSURLSession, without any other dependency.
- **C**onform **Adapter Design Pattern**. `AaHTTP` act as frontend which provides all functionality, and `AaNet` act as backend provide service for `AaHTTP`. Under such design, you can always alternate network backend to other implementation(e.g `AFNetowrking`, `Alamofire`) without change any code in your project.
- **E**asily customize, less than 200 lines of code with straightforward logic. you can easily do some customization based on your need.

## Configure

Just drag `AaNet.swift`, `AaHTTP.swift` from demo project to your project folder. then everything is ready.

## Usage

- Simple Get Request

```swift
        aht.shareInstance.fetch("http://yahoo.com").go({ (result) in
            print(result)
            }) { (error) in
                print(error)
        }
```

- Get with parameters

```swift
        aht.shareInstance.fetch("http://cn.bing.com/dict/").paras(["q":"jeopardize"]).go({ (result) in
            print(result)
            }) { (error) in
                print(error)
        }
```

- Post with parameters

```swift
        aht.shareInstance.post("http://cn.bing.com/dict/").paras(["q":"jeopardize"]).go({ (result) in
            print(result)
            }) { (error) in
                print(error)
        }
```

- Default parameter:
- Universal hostname: 
- JSON integrate:

`Just take a look at AaHTTP.swift`