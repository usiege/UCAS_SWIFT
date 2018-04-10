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
        
        //在view上画一个矩形框
        UIColor.white.setStroke()
        let frame = CGRect(x: 20, y: 30, width: 100, height: 100)
        UIRectFrame(frame)
        
        //在view上画图片
        let imagepath = Bundle.main.path(forResource: "dog", ofType: "png")
        let image = UIImage(contentsOfFile: imagepath!)
        image?.draw(in: CGRect(x: 150, y: 30, width: 100, height: 100))
        
        //在view上写字
        let title: NSString = "薛定鄂的狗"
        let attr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24)]
        title.draw(at: CGPoint(x: 150, y: 150), withAttributes: attr)
        
        //context CGContext
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 275, y: 210))
        context?.addLine(to: CGPoint(x: 210, y: 350))
        context?.addLine(to: CGPoint(x: 360, y: 350))
        context?.closePath()
        
        UIColor.black.setStroke()  //描边参数
        UIColor.brown.setFill() //填充参数
        context?.saveGState()   //保存图形上下文设置
        
        UIColor.cyan.setFill()
//        context?.saveGState()     //恢复最近的一次上下文设置
        context?.restoreGState()    //恢复之前的上下文设置,若之前没有保存过就恢复会产生崩溃
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
        
        //bezier curve
        let cgContext = UIGraphicsGetCurrentContext()
        cgContext?.move(to: CGPoint(x: 330, y: 0))  //点
        cgContext?.addCurve(to: CGPoint(x: 330, y: 0), control1: CGPoint(x: 332, y: 26), control2: CGPoint(x: 330, y: 26))  //曲线
        cgContext?.addCurve(to: CGPoint(x: 330, y: 26), control1: CGPoint(x: 199, y: 20), control2: CGPoint(x: 299, y: 17))
        cgContext?.addLine(to: CGPoint(x: 296, y: 17))  //直线
        cgContext?.strokePath()
        
        //quartz
        let catpath = Bundle.main.path(forResource: "cat", ofType: "png")
        let catimage = UIImage(contentsOfFile: catpath!)
        let cgcatimage = catimage?.cgImage
        
        context?.saveGState()
        context?.translateBy(x: 0, y: catimage!.size.height)
        context?.scaleBy(x: 1, y: -1)
        
        let touchrect = CGRect(x: width, y: -height, width: catimage!.size.width, height: catimage!.size.height)
        context?.draw(cgcatimage!, in: touchrect)
        context?.restoreGState()
        /*
         CTM Current Transformation Matrix 当前变换矩阵
         包括：
         context?.rotate(by: <#T##CGFloat#>) 旋转
         context?.scaleBy(x: <#T##CGFloat#>, y: <#T##CGFloat#>) 缩放
         context?.translateBy(x: <#CGFloat#>, y: <#CGFloat#>) 平移 以UIKit坐标原点改变每个点的x，y
         
         当相周的绘制程序在一个UIView对象和Quartz图形上下文上进行绘制时，需要做一个变换，使它们拥有一个坐标系；
         这需要将Quartz图形上下文的原点平移到左上角，y轴对称变换；
         
         注：UI和CG的坐标系不同会导致很多奇怪的现象发生，转换需谨慎；
         同样是draw函数 context uiimage cgimage画的坐标系不一样；
         
         affine 仿射变换，如下；
         */ 
    
        context?.saveGState()
        var myaffine = CGAffineTransform(translationX: 0, y: catimage!.size.height)
        myaffine = myaffine.scaledBy(x: 1, y: -1)
        context?.concatenate(myaffine)  //连结CTM坐标系
        context?.restoreGState()
        context?.draw(cgcatimage!, in: touchrect)
    }
    
}
