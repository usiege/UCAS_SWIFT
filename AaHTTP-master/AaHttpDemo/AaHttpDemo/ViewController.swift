//
//  ViewController.swift
//  AaHttpDemo
//
//  Created by aaaron7 on 16/4/2.
//  Copyright © 2016年 aaaron7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!

    @IBAction func onGo(sender: AnyObject) {

        aht.shareInstance.fetch(textField.text!).go({ (result) in
            dispatch_async(dispatch_get_main_queue(), {
                self.textView.text = result
            })
            }) { (error) in
                print(error)
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

