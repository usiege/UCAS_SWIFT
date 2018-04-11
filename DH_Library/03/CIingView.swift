//
//  CIingView.swift
//  DH_Library
//
//  Created by user on 2018/4/11.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

class CIingView: UIView {
    
    var imageView: UIImageView = UIImageView()
    var image : UIImage = UIImage()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var inputImageView: UIImageView = UIImageView()
    var outputImageView: UIImageView = UIImageView()
    
    
    //识别人脸
    func detect() {
        let context = CIContext(options: nil)
        let imageInput = self.inputImageView.image
        let image = CIImage(cgImage: (imageInput?.cgImage)!)
        
        //设置识别参数
        let param = [CIDetectorAccuracyHigh : CIDetectorAccuracy]
        
        //声明一个CIDetector，并设定识别类型
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: param)
        
        //取得识别结果
        let detectResult = faceDetector?.features(in: image)
        let resultView = UIView(frame: self.inputImageView.frame)
        self.addSubview(resultView)
        
        for item in detectResult! {
            let faceFeature = item as! CIFaceFeature
            //脸部
            let faceView = UIView(frame:faceFeature.bounds)
            
            faceView.layer.borderWidth = 1
            faceView.layer.borderColor = UIColor.orange.cgColor
            resultView.addSubview(faceView)
            
            //左眼
            if faceFeature.hasLeftEyePosition {
                let leftEyeView = UIView(frame:CGRect(x: 0, y: 0, width: 5, height: 5))
                leftEyeView.center = faceFeature.leftEyePosition
                leftEyeView.layer.borderWidth = 1
                leftEyeView.layer.borderColor = UIColor.red.cgColor
                resultView.addSubview(leftEyeView)
            }
            
            //右眼
            if faceFeature.hasRightEyePosition {
                let rightEyeView = UIView(frame:CGRect(x: 0, y: 0, width: 5, height: 5))
                rightEyeView.center = faceFeature.rightEyePosition
                rightEyeView.layer.borderWidth = 1
                rightEyeView.layer.borderColor = UIColor.red.cgColor
                resultView.addSubview(rightEyeView)
            }
            
            //嘴巴
            if faceFeature.hasMouthPosition {
                let mouthView = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: 5))
                mouthView.center = faceFeature.mouthPosition
                mouthView.layer.borderWidth = 1
                mouthView.layer.borderColor = UIColor.red.cgColor
                resultView.addSubview(mouthView)
            }
        }
        
        resultView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        if (detectResult?.count)! > 0 {
            let faceImage = image.cropped(to: detectResult![0].bounds)
            
            let face = UIImage(cgImage: context.createCGImage(faceImage, from: faceImage.extent)!)
            self.outputImageView.image = face
            
            _ = String(format: "识别 人脸数 %i", (detectResult?.count)!)
        }
        
    }
    
    
    //旧色调
    func filterSepiaTone(value : Float) {
        
        let context = CIContext(options: nil)
        let cImage = CIImage.init(cgImage: self.image.cgImage!)
        
        let sepiaTone = CIFilter(name: "CISepiaTone")
        sepiaTone?.setValue(cImage, forKey: "inputImage")
        
        _ = String(format: "旧色调 Intensity : %.2f", value)
        
        sepiaTone?.setValue(value, forKey: "inputIntensity")
        let result = sepiaTone?.value(forKey: "outputImage") as! CIImage
        
        let imageRef = context.createCGImage(result, from: CGRect(x: 0, y: 0, width: self.imageView.image!.size.width, height: self.imageView.image!.size.height))
        
        let image =  UIImage.init(cgImage: imageRef!)
        self.imageView.image = image
        
    }
    
    //高斯模糊
    func filterGaussianBlur(value : Float) {
        
        let context = CIContext(options: nil)
        let cImage = CIImage.init(cgImage: self.image.cgImage!)
        
        let gaussianBlur = CIFilter(name: "CIGaussianBlur")
        gaussianBlur?.setValue(cImage, forKey: "inputImage")
        
        _ = String(format: "高斯模糊 Radius : %.2f",value * 10)
        
        gaussianBlur?.setValue(value, forKey: "inputRadius")
        let result = gaussianBlur?.value(forKey: "outputImage") as! CIImage
        
        let imageRef = context.createCGImage(result, from: CGRect(x: 0, y: 0, width: self.imageView.image!.size.width, height: self.imageView.image!.size.height))
        
        let image =  UIImage(cgImage: imageRef!)
        self.imageView.image = image
        
    }
    

}
