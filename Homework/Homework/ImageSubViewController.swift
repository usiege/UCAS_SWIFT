//
//  ImageViewController.swift
//  UCAS_05
//
//  Created by charles on 2018/6/10.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

class ImageSubViewController: UIViewController {

    var imageURI: String?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func tapEvent(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imageView.isUserInteractionEnabled = true
        
        DispatchQueue.global().async {
            let url = URL.init(string: self.imageURI ?? "")
            let imageData = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                if imageData != nil {
                    self.imageView.image = UIImage(data: imageData!)
                } else {
                    self.imageView.image = nil
                }
            }
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
