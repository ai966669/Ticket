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
        return ColorByRGB(234, G: 0, B: 0, A: 1)
    }
    
    class func SubTextColor() -> UIColor{
        return ColorByRGB(153, G: 153, B: 153, A: 1)
    }
    
    class func BlackTextColor() -> UIColor{
        return ColorByRGB(76, G: 76, B: 76, A: 1)
    }
    
    
    class func SeperateLineColor() -> UIColor{
        return ColorByRGB(239, G: 239, B: 244, A: 1)
    }
}
