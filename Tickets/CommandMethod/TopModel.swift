//
//  TopModel.swift
//  SuperGina
//
//  Created by apple on 15/7/23.
//  Copyright (c) 2015年 Anve. All rights reserved.
//

import UIKit

typealias SessionFailBlock = (code:Int) -> Void
typealias SessionSuccessBlock = (model : AnyObject?) -> Void

///
/**
*  登录相关二级路径 URLAppBasic
*/

/// 启动
let URLSystemStart="/system/start"

/// 获取系统时间

let URLSystemTime="/system/time"

/// 获取上传文件token

let URLSystemUpToken="/system/upToken"

/// 普通登陆
let URLUserLogin="/user/login"

//验证码登陆
let URLUserCodeLogin="/user/code/login"

//获取聊天对象

let URLUserChatObject="/user/chat/object"

//获取验证码

let URLUserCode="/user/code"

// 通过token登录

let URLUserTokenLogin="/user/token/login"


//获取最新版本号
let URLSystemVersion="/system/version"


//发起支付
let URLOrderCreateCharge="/order/create/charge"

/// 登出
let URLUserLogout="/user/logout"

//提现
let URLWalletTransfer="/wallet/transfer"

//特权
let URLPrivilege = "/privilege.html"

//服务与隐私条款
let URLTmservice = "/tmservice.html"

//常见问题
let URLIssues = "/issues.html"

//黑卡介绍
let URLIntro = "/intro.html"

//获取订单详情
let URLOrderDetail = "/order/detail"

//
let URLOrderCashback = "/order/cashback"

//购卡
let URLCardCreateCharge="/card/create/charge"
//code : -1.网络问题，未连接上服务器，-2 返回数据为空 -3code 返回的必要数据为空 -4.提示Msg为nil -5.解析错误
let codeTokenUnvalible = -1014
let codeOverTime = 3840 //属于-1中的问题
let codeErrorReturn = -3
let codeUnexpected = 0

class TopModel: NSObject {
    /**
     对请求参数进行操作
     
     - parameter params: 需要处理的参数列表，字典形式
     
     - returns: 处理后的参数列表
     */
    static var activityIndicator:UIActivityIndicatorView?
    class func unverisalProcess(var params:Dictionary<String, String>)->Dictionary<String, String>{
        //增加必要字段
        params = addNeccessayParamUniversal(params)
        //添加签名
        params = addSign(params)
        
        return params
        
    }
    /**
     同unverisalProcess，但是该接口提供给特殊请求用。
     
     1.启动:system/start
     
     2.登录:user/login
     
     - parameter params: 需要处理的参数列表，字典形式
     
     - returns: 处理后的参数
     */
    class func specialProcess(params:Dictionary<String, AnyObject>)->Dictionary<String, String>{
        var paramsReturn = Dictionary<String, String>()
        for (key,value) in params {
            paramsReturn[key] = "\(value)"
        }
        
        //增加必要字段
        paramsReturn = addNeccessayParamSpecial(paramsReturn)
        //    添加签名
        paramsReturn = addSign(paramsReturn)
        
        return paramsReturn
    }
    private class func addNeccessayParamSpecial(var params:Dictionary<String, String>)->Dictionary<String, String>{
        // 必要字段  nonc
        params["nonce"] = "\(arc4random()%1000000)"
        return params
    }
    private class func addNeccessayParamUniversal(var params:Dictionary<String, String>)->Dictionary<String, String>{
        // 必要字段   session_id，nonc
        if UserModel.shareManager.session_id != ""{
            params["session_id"] = UserModel.shareManager.session_id
        }else{
            let token : (session_id:String,isHaveToken:Bool) = DatabaseUserDefaults.isHaveSession_id()
            if  token.isHaveToken{
                params["session_id"] = token.session_id
            }else{
                params["session_id"] = "default"
            }
        }
        if UserModel.shareManager.uid != ""{
            params["userId"] = UserModel.shareManager.uid
        }else {
            let  lastUserId = NSUserDefaults.standardUserDefaults().valueForKey(TKConfig.UD_LastTimeUserId) as? String
            if (lastUserId != "") && (lastUserId != nil) {
                params["userId"] = "\(lastUserId!)"
            }else{
                params["userId"] = "default"
                //params["userId"] = "联系壮壮，参数错了"
            }
        }
        params["nonce"] = "\(arc4random()%1000000)"
        return params
    }
    //    添加签名
    private class func addSign(var params:Dictionary<String,String>)->Dictionary<String, String>{
        var keys=[String]()
        var values=[String]()
        for aParam in params{
            //0105遍历字典的key
            keys.append("\(aParam.0)")
            values.append("\(aParam.1)")
        }
        if keys.count>=2{
            for i in 2...keys.count{
                for k in 0...(keys.count-i){
                    if keys[k].compare(keys[k+1]) == NSComparisonResult.OrderedDescending {
                        let string=keys[k]
                        keys[k]=keys[k+1]
                        keys[k+1]=string
                        let value=values[k]
                        values[k]=values[k+1]
                        values[k+1]=value
                    }
                }
            }
        }
        var string = keys[0]+"="+values[0]
        if keys.count > 1{
            for i  in 1...keys.count-1{
                string += "&"+keys[i]+"="+values[i]
            }
        }
        params["sign"]=CocoaSecurity.md5(string).hexLower
        return params
    }
    
    class func universalRequest(requestMethod requestMethod:Method,dic:Dictionary<String,AnyObject>,urlMethod:String,success:SessionSuccessBlock,failure:SessionFailBlock) -> Request {
        //网络请求
        let aurlMethod=urlMethod
        print("\(aurlMethod)")
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            if (activityIndicator == nil){
                activityIndicator=UIActivityIndicatorView(frame: CGRectMake(0,0,ScreenW,ScreenH))
                activityIndicator?.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.WhiteLarge
            }else{
                activityIndicator?.removeFromSuperview()
            }
            let aUIViewController:UIViewController = HelpFromOc.getPresentedViewController()
            aUIViewController.view.addSubview(activityIndicator!)
            activityIndicator?.startAnimating()
        }
        var url="\(TKConfig.BaseURL)\(urlMethod)"
        return request(requestMethod, url, parameters: dic, encoding:ParameterEncoding.URL).response { (request, response, data, error) -> Void in
            if (activityIndicator != nil){
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    activityIndicator?.stopAnimating()
                }
            }
            if response?.statusCode != 0 && response?.statusCode != 200{
                
                SVProgressHUD.showErrorWithStatus("网络异常")
                Log(response)
                Log(error)
                if response?.statusCode == codeOverTime {
                    
                }
                failure(code: -1)
            }else{
                guard let data = data  else {
                    Log("无数据返回")
                    if error != nil{
                        SVProgressHUD.showErrorWithStatus("请求错误")
                    }
                    failure(code: -2)
                    return
                }
                
                do {
                    if	let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves) as? [String : AnyObject]{
                        guard let ret_code = json["status"] as? Int else{
                            Log("返回数据无status")
                            failure(code: codeErrorReturn)
                            return
                        }
                        if ret_code == 0{
                            success(model: json)
                        }else{
                            if ret_code == 1{
                                if let msg =  json["msg"] as? String {
                                    SVProgressHUD.showErrorWithStatus(msg)
                                }
                            }
                            failure(code: ret_code)
                        }
                    }
                }catch let error2 as NSError {
                    failure(code: -5)
                    Log(error2.description)
                }
            }
        }
    }
    /**
     查看返回的错误id是不是特殊的错误id。这里指的特殊是，这些id不光要显示，而且客户端需要做出对应的操作
     
     - parameter code: 需要查看的网络返回码
     */
//    static let  SpecailCodes=[TKConfig.RequestErrCodeAlreadyLogin,HKConfig.RequestErrCodeLoginExpire,HKConfig.RequestErrCodeLoginPlease,HKConfig.RequestErrCodeNoUser,HKConfig.RequestErrUnActive]
//    
//    
//    class func isSpecailCode(code:Int)->Bool{
//        for SpecailCode in SpecailCodes{
//            if code == SpecailCode{
//                return true
//            }
//        }
//        return false
//    }
    
}
