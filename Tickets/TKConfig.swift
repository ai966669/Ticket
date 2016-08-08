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
    static let UD_LastTimeSignSessionId = "UD_LastTimeSignSessionId"
    static let UD_LastTimeUserId = "UD_LastTimeUserId"
    static var BaseURL:String {
        get{
//            var value="http://192.168.1.101:8080/" //192.168.1.101:8080  http://121.43.63.65/
            var value="http://192.168.1.103:8080/" //192.168.1.103:8080
            if !environmentIsTest{
//                http://api.geiquanba.com/coupon/coupon/list?page=1&pageSize=1
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
    /// 更新
    static let URLUserUserUpdate="/user/user/update"
     /// 密码重置
    static let URLUserValidateReset="/user/validate/reset"
     /// 发送注册验证码
    static let URLUserValidateRegist="/user/validate/regist"
     /// banner列表
    static let URLBannerBannerList="/banner/banner/list"
    /// 卡券列表
    static let URLCouponCouponList="/coupon/coupon/list"
    static let URLTaskMarkMark="/task/mark/mark"
    static let URLOrderOrderCreate="/order/order/create"
    //七牛token
    static let URLIndexIndexConfig="/index/index/config"
    //首页
    /// 根据卡券id请求卡券信息
    static let URLCouponCouponDetail="/coupon/coupon/detail"
    
}
