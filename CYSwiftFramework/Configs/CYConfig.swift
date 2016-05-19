//
//  CYConfig.swift
//  01-JF-swift体验
//
//  Created by JF on 16/5/18.
//  Copyright © 2016年 JF. All rights reserved.
//

import Foundation
import UIKit

final class CYConfig {
    
    static let appURLString = "itms-apps://itunes.apple.com/app/id" + "983812"
    
    struct Notification {
        static let example = "CYConfig.Notification.example"
    }
    
    class func getScreenRect() -> CGRect {
        return UIScreen.mainScreen().bounds
    }
}
