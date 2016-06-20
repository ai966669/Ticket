//
//  BtnExtension.swift
//  Tickets
//
//  Created by ai966669 on 16/5/25.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
extension UIButton{
    class func createBackButton(title: String?,action:Selector,target:AnyObject) -> UIBarButtonItem? {
        let image = UIImage(named: "btn-back")
        if image != nil {
            let backButton = UIButton(type: UIButtonType.Custom)
            backButton.backgroundColor=UIColor.yellowColor()
            backButton.bounds = CGRectMake(0, 0, 100, 30)
            backButton.setImage(image, forState: UIControlState.Normal)
            backButton.addTarget(target, action:action, forControlEvents: UIControlEvents.TouchUpInside)
            let bbiBack = UIBarButtonItem(customView: backButton)
            return bbiBack
        }
        return nil
    }
}
