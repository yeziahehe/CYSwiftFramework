//
//  String+CY.swift
//  CYSwiftFramework
//
//  Created by JF on 16/5/19.
//  Copyright © 2016年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import UIKit

extension String{
    func contains(find: String) -> Bool{
        return self.rangeOfString(find) != nil
    }
}
