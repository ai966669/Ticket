//
//  TKConfig.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import AVFoundation
func Log<T>(message: T) {
//    #if DEBUG
    print("\(message)")
//    #endif
}
class TKConfig: NSObject {
    static let environmentIsTest=true
    static let UD_LastTimeSignSession_id = "UD_LastTimeSignSession_id"
    static let UD_LastTimeUserId = "UD_LastTimeUserId"
    static var BaseURL:String {
        get{
            var value="http://121.43.63.65:8888"
            if !environmentIsTest{
                value = "https://app.ultimavip.cn"
            }
            return value
        }
    }
    /// 注册
    static let URLUserUserRegist="/user/user/regist"
    static let URLUserUserLogin="/user/user/login"
    static let URLUserUserInfo="/user/user/info"
     /// 密码重置
    static let URLUserValidateReset="/user/validate/reset"
     /// 发送注册验证码
    static let URLUserValidateRegist="/user/validate/regist"
    
}
