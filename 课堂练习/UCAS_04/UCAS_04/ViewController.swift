//
//  ViewController.swift
//  UCAS_04
//
//  Created by charles on 2018/6/3.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

extension ViewController: UIDropInteractionDelegate {
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self) && session.canLoadObjects(ofClass: NSURL.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        for item in session.items {
            let itemProvider = item.itemProvider
            guard itemProvider.canLoadObject(ofClass: UIImage.self) else {
                continue
            }
            
            itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { (object, error) in
                if let image = object as? UIImage {
                    
                }
            })
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    var imageURL: URL? {
        didSet {
            getImage();
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
    
    func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
        sender.scale = 1
    }
    
    func getImage() {
        if let url = imageURL {
            DispatchQueue.global().async {
                let imageData = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if imageData != nil {
                        self.image = UIImage(data: imageData!)
                    } else {
                        self.image = nil
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.addSubview(imageView)
        
        
        
//        let constrait = NSLayoutConstraint(item: self.view,
//                                           attribute: .width,
//                                           relatedBy: <#T##NSLayoutRelation#>,
//                                           toItem: <#T##Any?#>,
//                                           attribute: <#T##NSLayoutAttribute#>,
//                                           multiplier: 1.0,
//                                           constant: <#T##CGFloat#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

