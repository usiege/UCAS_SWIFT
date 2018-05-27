//
//  ViewController.swift
//  UCAS_02
//
//  Created by charles on 2018/5/27.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var faceView: SmilingView!
    
    var result: Int = 0 {
        didSet {
            result = min(max(result, 0), 0)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .ended: fallthrough
        case .changed:
            let translation = sender.translation(in: faceView)
            let changes = Int(translation.y)
            result += changes
            sender.setTranslation(CGPoint.zero, in: faceView)
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





