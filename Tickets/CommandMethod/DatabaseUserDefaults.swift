//
//  DatabaseUserDefaults.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class DatabaseUserDefaults: NSObject {
    class func isHaveSession_id() -> (String,Bool){
        if let session_id = NSUserDefaults.standardUserDefaults().valueForKey(TKConfig.UD_LastTimeSignSession_id) as? String {
            if session_id != ""  {
                return (session_id,true)
            }
        }
        return ("",false)
    }
}
