//
//  UIImage+CY.swift
//  CYSwiftFramework
//
//  Created by JF on 16/5/19.
//  Copyright © 2016年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /**
     According to the name of the picture to back a picture that can stretch
     
     - parameter name: image name
     */
    class func resizedImage(name: String) -> UIImage {
        let image = UIImage(named: name)
        
        if let image = image {
            return image.stretchableImageWithLeftCapWidth(NSInteger(image.size.width * 0.5), topCapHeight: NSInteger(image.size.height * 0.5))
        }
        
        return UIImage()
    }
    
    var width: CGFloat {
        return self.size.width
    }
    
    var height: CGFloat {
        return self.size.height
    }
    
    /**
     *  压缩图片,并返回压缩后的图片(按比例压缩)
     */
    func imageCompressWithTargetWidth(targetWidth: CGFloat) -> UIImage {
        let targetHeight = (targetWidth / self.width) * self.height
        
        UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight))
        
        self.drawInRect(CGRectMake(0, 0, targetWidth, targetHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /**
     *  返回一张模糊的图片 (使用CPU处理)
     *  value: 模糊程度
     *  return: 返回处理后的图片
     */
    func blurImage(value: NSNumber) -> UIImage {
        let context = CIContext(options: [kCIContextUseSoftwareRenderer: true])
        let ciImage = CoreImage.CIImage(image: self)
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(value, forKey: "inputRadius")
        
        if blurFilter?.outputImage == nil || ciImage == nil {
            return UIImage()
        }
        
        let imageRef = context.createCGImage((blurFilter?.outputImage)!, fromRect: (ciImage?.extent)!)
        let newImage = UIImage(CGImage: imageRef)
        
        return newImage
    }
    
}
