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
    class func DefaultBackgroundColor()->UIColor{
        return ColorByRGB(241, G: 241, B: 241, A: 1)
    }
    
    class func TopicColor() -> UIColor{
        return ColorByRGB(231, G: 11, B: 23, A: 1)
    }
}
