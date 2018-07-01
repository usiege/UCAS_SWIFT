//
//  FaceViewController.swift
//  Homework
//
//  Created by charles on 2018/7/1.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

extension FaceViewController: FaceViewDataSource {
    
    func smilenessForFaceView(_ sender: SmileFaceView) -> CGFloat {
        return CGFloat(result - 50) / 50
    }
    
}


class FaceViewController: UIViewController {

    @IBOutlet var faceView: SmileFaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(pinchAction)))
        }
    }
    
    @objc
    func pinchAction(_ sender: UIPinchGestureRecognizer) {
        faceView.faceScale += sender.scale - 1
        sender.scale = 1
    }
    
    
    var result: Int = 0 {
        didSet {
            result = min(max(result, 0), 100)
            updateUI();
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
