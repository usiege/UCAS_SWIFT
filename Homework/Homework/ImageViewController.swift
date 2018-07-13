//
//  ImageViewController.swift
//  Homework
//
//  Created by user on 2018/7/13.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

extension ImageViewController: UIScrollViewDelegate {
    ///返回被缩放的视图
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

class ImageViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
        }
    }
    @IBOutlet weak var textLabel: UILabel!
    
    var imageURL: URL? {
        willSet {
            getImage(url: newValue);
        }
        didSet {
            print(oldValue ?? "image 为空！！！")
        }
    }
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
            scrollView.setNeedsLayout()
        }
    }
    
    var imageView = UIImageView()
    
    @IBAction func pinchEvent(_ sender: UIPinchGestureRecognizer) {
        imageView.transform = CGAffineTransform.init(scaleX: sender.scale, y: sender.scale)
    }
    
    func isLoding(enable: Bool) {
        self.textLabel.isHidden = !enable
        UIApplication.shared.isNetworkActivityIndicatorVisible = enable
    }
    
    func getImage(url: URL?) {
        if let url = url {
            self.isLoding(enable: true)
            DispatchQueue.global().async {
                let imageData = try? Data(contentsOf: url)
//                self.navigationController?.navigationBar.trailingAnchor
                DispatchQueue.main.async {
                    
                    self.isLoding(enable: false)
                    
                    if imageData != nil {
                        self.image = UIImage(data: imageData!)
                    } else {
                        self.image = nil
                    }
                }
            }
        }
    }
    
    let urls = [URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528031543880&di=1cbfd3f8c7a989e7f5d67911a7a3164a&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fc%2F581ff4b6a1149.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.addSubview(imageView)
        self.imageURL = urls[0]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
