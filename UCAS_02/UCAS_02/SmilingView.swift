//
//  SmilingView.swift
//  UCAS_02
//
//  Created by charles on 2018/5/27.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

protocol DataSource: class {
    
}

class SmilingView: UIView {
    
//    override var gestureRecognizers: [UIGestureRecognizer]?
    
    var faceCenter: CGPoint {
        return self.convert(center, from: superview)
    }
    
    var faceRadius: CGFloat {
        return min(bounds.size.width/2, bounds.size.height/2)
    }
    
    @IBInspectable  //会在xib里出现属性
    var faceLineWidth: CGFloat = 3
    
    var faceColor: UIColor = UIColor.blue
    
    var faceScale: CGFloat = 0.9

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let facePath = UIBezierPath(arcCenter: faceCenter,
                                    radius: faceRadius,
                                    startAngle: 0,
                                    endAngle: CGFloat(2*Double.pi),
                                    clockwise: true)
        facePath.lineWidth = faceLineWidth
        faceColor.set()
        facePath.stroke()
        
        let smilenss: CGFloat = 1.0
        drawSmile(smilenss).stroke()
    }

    func drawSmile(_ smilenamesForFace: CGFloat) -> UIBezierPath {
        
        var beginPoint = faceCenter
        var endPoint = faceCenter
        
        beginPoint.x -= 0.6 * faceRadius
        beginPoint.y += 0.4 * faceRadius
        endPoint.x += 0.6 * faceRadius
        endPoint.y += 0.4 * faceRadius
        
        var ctrPoint1 = beginPoint
        var ctrPoint2 = endPoint
        
        ctrPoint1.x += 0.3 * faceRadius
        ctrPoint1.y += 0.4 * faceRadius * smilenamesForFace
        ctrPoint2.x += 0.3 * faceRadius
        ctrPoint2.y += 0.4 * faceRadius * smilenamesForFace
        
        let smilePath = UIBezierPath()
        smilePath.move(to: beginPoint)
        smilePath.addCurve(to: endPoint,
                           controlPoint1: ctrPoint1,
                           controlPoint2: ctrPoint2)
        smilePath.lineWidth = faceLineWidth
        
        return smilePath
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//

}
