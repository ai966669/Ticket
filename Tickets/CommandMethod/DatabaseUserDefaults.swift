//
//  DatabaseUserDefaults.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class DatabaseUserDefaults: NSObject {
    static let shareManager = DatabaseUserDefaults()
    func setSessionId(session_id:String){
        NSUserDefaults.standardUserDefaults().setValue(session_id, forKey: TKConfig.UD_LastTimeSignSession_id)
    }
    func isHaveSession_id() -> (String,Bool){
        if let session_id = NSUserDefaults.standardUserDefaults().valueForKey(TKConfig.UD_LastTimeSignSession_id) as? String {
            if session_id != ""  {
                return (session_id,true)
            }
        }
        return ("",false)
    }
//    func <#name#>(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
//    
//    nsuserda
}
