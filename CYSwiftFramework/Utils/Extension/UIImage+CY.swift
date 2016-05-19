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
    
}
