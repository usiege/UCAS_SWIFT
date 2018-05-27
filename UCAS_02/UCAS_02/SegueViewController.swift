//
//  SegueViewController.swift
//  UCAS_02
//
//  Created by charles on 2018/5/27.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {
    
    @IBAction func prepare(_ sender: Any) {
        self.performSegue(withIdentifier: "btnsegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var destination = segue.destination
        
        if let nvc = destination as? UINavigationController {
            destination = nvc.visibleViewController ?? destination
        }
        
        if let vc = destination as? ViewController {
        
            if let identifer = segue.identifier {
                vc.title = identifer
                
                switch identifer {
                case "vcsegue":
                    vc.result = 100
                    
                case "btnsegue":
                    vc.result = 1;
                    
                default:
                    break;
                }
            }
        }
    }
//
    

}
