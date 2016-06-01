//
//  CYMacros.swift
//  CYSwiftFramework
//
//  Created by 叶帆 on 16/5/18.
//  Copyright © 2016年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

// Commonly used method

import UIKit

typealias CancelableTask = (cancel: Bool) -> Void

func delay(time: NSTimeInterval, work: dispatch_block_t) -> CancelableTask? {
    
    var finalTask: CancelableTask?
    
    let cancelableTask: CancelableTask = { cancel in
        if cancel {
            finalTask = nil // key
            
        } else {
            dispatch_async(dispatch_get_main_queue(), work)
        }
    }
    
    finalTask = cancelableTask
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
        if let task = finalTask {
            task(cancel: false)
        }
    }
    
    return finalTask
}

func cancel(cancelableTask: CancelableTask?) {
    cancelableTask?(cancel: true)
}

class CYMacros: NSObject {
    
    // load local json file to NSDictionary
    class func dictionaryWithJsonFileName(name: String) -> NSDictionary {
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "json")
        
        if let path = path {
            let nsUrl = NSURL(fileURLWithPath: path)
            
            let data: NSData? = NSData(contentsOfURL: nsUrl)
            
            if let data = data {
                if let metaData = try? NSJSONSerialization.JSONObjectWithData(data, options: []) {
                    return metaData as! NSDictionary
                }
            }
        }
        
        return NSDictionary()
    }
    
    // load Storyboard - ViewController
    class func viewControllerWithStoryboardName(name: String, identifier: String) -> UIViewController {
        let vc = UIStoryboard(name: name, bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(identifier)
        return vc
    }
    
}
