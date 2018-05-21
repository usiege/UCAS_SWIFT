//
//  ViewController.swift
//  DH_Library
//
//  Created by user on 2017/8/16.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.isHidden = true
        let view = FillingView.init(frame: UIScreen.main.bounds)
        self.view.addSubview(view)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

