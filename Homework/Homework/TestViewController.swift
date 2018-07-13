//
//  TestViewController.swift
//  Homework
//
//  Created by user on 2018/7/13.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    var pagename: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.predicateTest(pattern: "")
    }

    
    func predicateTest(pattern: String) {
        
        let email = "lifusc464@qq.co <_____> mlifus <____> c464@qq.c <______> ifusc4 <_______> sc464@qq.com\n"
        let rangeindex = email.range(of: "_{5}", options: .regularExpression,
                                     range: email.startIndex..<email.endIndex, locale:Locale.current)
        print(email.substring(with: rangeindex!))   //输出；1483
        
        var result = String.init(email)
        while let rangeIndex = result.range(of: "_{6}", options: .regularExpression,
                                            range: result.startIndex..<result.endIndex, locale:Locale.current)
        {
            result = result.replacingCharacters(in: rangeIndex, with: "_____")
            print(result)
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
