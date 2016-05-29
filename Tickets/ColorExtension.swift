//
//  ColorExtension.swift
//  Tickets
//
//  Created by ai966669 on 16/5/26.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
extension UIColor{
    class func ColorByRGB(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat)->UIColor{
        return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
    }
}
