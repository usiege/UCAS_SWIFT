//
//  DNViewController.swift
//  UCAS_04
//
//  Created by charles on 2018/6/3.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

class DNViewController: UIViewController {

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
        if let ivc = segue.destination as? ViewController {
            if let id = segue.identifier {
                switch id {
                case "image1":
                    ivc.imageURL = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528031543880&di=1cbfd3f8c7a989e7f5d67911a7a3164a&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fc%2F581ff4b6a1149.jpg")
                    
                case "image2":
                    ivc.imageURL = URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=271441279,632559570&fm=27&gp=0.jpg")
                case "image3":
                    ivc.imageURL = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528627905&di=68a2eba1b3b40952c6ecbc31bb4190ea&imgtype=jpg&er=1&src=http%3A%2F%2Fwow.tgbus.com%2FUploadFiles_2396%2F201205%2F20120518203837576.jpg")
                default:
                    break

                }
            }
        }
    }
 

}
