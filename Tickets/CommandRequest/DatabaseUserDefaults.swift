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
        NSUserDefaults.standardUserDefaults().setValue(session_id, forKey: TKConfig.UD_LastTimeSignSessionId)
    }
    func isHaveSessionId() -> (String,Bool){
        if let sessionId = NSUserDefaults.standardUserDefaults().valueForKey(TKConfig.UD_LastTimeSignSessionId) as? String {
            if sessionId != ""  {
                return (sessionId,true)
            }
        }
        return ("",false)
    }
}
