//
//  FillingView.swift
//  FillingRect
//
//  Created by 关东升 on 15/1/24.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import UIKit

class FillingView: UIView {

    override func draw(_ rect: CGRect) {
        let width = self.bounds.size.width/2
        let height = self.bounds.size.height/2
        
        UIColor.red.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: width, height: height))
        UIColor.yellow.setFill()
        UIRectFill(CGRect(x: width, y: 0, width: width, height: height))
        UIColor.blue.setFill()
        UIRectFill(CGRect(x: 0, y: height, width: width, height: height))
        UIColor.green.setFill()
        UIRectFill(CGRect(x: width, y: height, width: width, height: height))
    }
    
}
