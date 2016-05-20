//
//  AaHTTP.swift
//  ConsultantLoop
//
//  Created by wenjin on 3/19/16.
//  Copyright © 2016 wenjin. All rights reserved.
//

import Foundation

enum RequestMethod{
    case Post
    case Get
}

typealias aht = AaHTTP

class AaHTTP {
    
    private var method : RequestMethod
    
    private let hostName = ""
    
    private var curUrl = ""
    
    private var parameters : [String : AnyObject] = [:]

    static let shareInstance = AaHTTP(m: .Get)
    
    init(m : RequestMethod){
        method = m
        setDefaultParas()
    }
    
    private func setDefaultParas(){
        self.parameters = [:]
        
        _ = defaultParameter().reduce("", combine: { (str, p) -> String in
            self.parameters[p.0] = p.1
            return ""
        })
    }
    
    func fetch(url : String) -> AaHTTP{
        setDefaultParas()
        curUrl = "\(hostName)\(url)"
        self.method = .Get
        return self
    }
    
    func post(url : String) -> AaHTTP{
        setDefaultParas()
        curUrl = "\(hostName)\(url)"
        self.method = .Post
        return self
    }
    
    func paras(p : [String:AnyObject]) -> AaHTTP{
        _ = p.reduce("") { (str, p) -> String in
            parameters[p.0] = p.1
            return ""
        }
        return self
    }
    
    func go(success : String -> Void, failure : NSError?->Void){
        var smethod = ""
        if method == .Get{
            smethod = "GET"
        }else{
            smethod = "POST"
        }
        
        AaNet.request(smethod, url: curUrl, form: parameters, success: { (data) -> Void in
            print("request successed in \(self.curUrl)")
            let result = String(data: data!, encoding: NSUTF8StringEncoding)
            success(result!)
            }) { (error) -> Void in
                print("request failed in \(self.curUrl)")
                failure(error)
        }
    }
    
    private func defaultParameter()->[String:AnyObject] {
        var result: [String : AnyObject] = [:]
        let version = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"]
        result["version"] = version

        result["app_type"] = "aahttp_demo"
        
        return result
    }
}