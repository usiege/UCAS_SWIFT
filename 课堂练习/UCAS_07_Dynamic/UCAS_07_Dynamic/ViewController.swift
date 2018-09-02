//
//  ViewController.swift
//  UCAS_07_Dynamic
//
//  Created by charles on 2018/6/10.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

extension ViewController: UIDynamicAnimatorDelegate {
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        
    }
}

class ViewController: UIViewController {
    
    @IBAction func tapAction(_ sender: Any) {
        drop()
    }
    
    func drop() {
        var rect = CGRect(origin: .zero, size: size)
        rect.origin.x = randomPos(perRow) * size.width
        
        print(NSStringFromCGRect(rect))
        let view = UIView(frame: rect)
        view.layer.cornerRadius = rect.width / 2
        view.backgroundColor = randomColor()
    
        self.animationView.addSubview(view)
        
        gravity.addItem(view)
        collider.addItem(view)
        dropBehavior.addItem(view)
    }
    
    @IBOutlet weak var animationView: UIView!
    
    lazy var animator: UIDynamicAnimator = {
       let lazyAnimator = UIDynamicAnimator(referenceView: self.animationView)
        lazyAnimator.delegate = self
        
        return lazyAnimator
    }()
    
    var gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        
        
        return collider
    }()
    
    lazy var dropBehavior: UIDynamicItemBehavior = {
       let drop = UIDynamicItemBehavior()
        drop.allowsRotation = true
        drop.isAnchored = true
        
        return drop
    }()
    
    var perRow = 10;
    var size: CGSize {
        let length = animationView.bounds.size.width / CGFloat(perRow)
        return CGSize(width: length, height: length)
    }
    
    func randomPos(_ max: Int) -> CGFloat {
        return CGFloat(arc4random() % UInt32(max))
    }
    
    func randomColor() -> UIColor {
        var color: UIColor?
        switch arc4random() % 5 {
            case 0: color = UIColor.red
            case 1: color = UIColor.orange
            case 2: color = UIColor.blue
            case 3: color = UIColor.yellow
            case 4: color = UIColor.green
            default: color = UIColor.black
        }
        return color!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animator.addBehavior(gravity)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

