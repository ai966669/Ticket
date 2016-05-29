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
class MsgShow: NSObject {
    static let ErrAnalysisServerData2Dic="返回数据有问题，服务器哥们儿要背锅了...."
}
class TKConfig: NSObject {
    static let environmentIsTest=true
    static let UD_LastTimeSignSession_id = "UD_LastTimeSignSession_id"
    static let UD_LastTimeUserId = "UD_LastTimeUserId"
    static var BaseURL:String {
        get{
            var value="http://121.43.63.65/" //192.168.1.101:8080  http://121.43.63.65:8888
            if !environmentIsTest{
                value = "https://app.ultimavip.cn"
            }
            return value
        }
    }
    
    static let QiniuUpToken=""
    static let QiniuUpTokenTime="QiniuUpTokenTime" 
    /// 注册
    static let URLUserUserRegist="/user/user/regist"
     /// 登陆
    static let URLUserUserLogin="/user/user/login"
     /// token登陆 ，获取个人信息
    static let URLUserUserInfo="/user/user/info"
     /// 密码重置
    static let URLUserValidateReset="/user/validate/reset"
     /// 发送注册验证码
    static let URLUserValidateRegist="/user/validate/regist"
     /// banner列表
    static let URLBannerBannerList="/banner/banner/list"
    /// 卡券列表
    static let URLCouponCouponList="/coupon/coupon/list"
    static let URLTaskMarkMark="/task/mark/mark"
    static let URLIndexIndexConfig="/index/index/config"
    
    
}
