//
//  DataType+CY.swift
//  CYSwiftFramework
//
//  Created by JF on 16/6/15.
//  Copyright © 2016年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import UIKit

extension String {
    var DoubleValue: Double {
        if let doubleV = Double(self) {
            return doubleV
        }
        
        return 0
    }
    
    var FloatValue: CGFloat {
        return CGFloat(self.DoubleValue)
    }
    
    var IntValue: Int {
        
        if let intV = Int(self) {
            return intV
        }
        
        return 0
    }
}


extension Int {
    var DoubleValue: Double {
        return Double(self)
    }
    
    var FloatValue: CGFloat {
        return CGFloat(self)
    }
    
    var StringValue: String {
        return String(self)
    }
}

extension Double {
    var IntValue: Int {
        return Int(self)
    }
    
    var FloatValue: CGFloat {
        return CGFloat(self)
    }
    
    var StringValue: String {
        return String(self)
    }
}

extension CGFloat {
    var DoubleValue: Double {
        return Double(self)
    }
    
    var IntValue: Int {
        return Int(self)
    }
    
    var StringValue: String {
        return String(self)
    }
}