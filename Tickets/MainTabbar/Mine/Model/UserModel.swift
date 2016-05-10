//
//  UserModel.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
class UserModel: TopModel {
    var uid = ""
    var session_id = ""
    var phone = ""
    var nickName = ""
    var job=""
    var test = 1
    private override init() {
        
    }
    static let shareManager = UserModel()
    //dohere正在做登陆，考虑用宏定义来给UserModel做一个单例，
//    func shareManager() -> UserModel {
//        static instance =
//        return
//    }
    class func loginByPsw(phone:String, password:String,failInLogin:()->Void,success:()->Void) {
        let param = TopModel.specialProcess(["phone":phone,"password":password])
        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserUserLogin, success: { (model) in
            success()
        }) { (code) in
            failInLogin()
        }
    }
    class func loginByToken(failNoToekn:()->Void,failInLogin:()->Void,success:()->Void){
        let token : (session_id:String,isHaveSession:Bool) = DatabaseUserDefaults.isHaveSession_id()
        if token.isHaveSession{
            let param =   TopModel.specialProcess(["session_id":token.session_id])
            TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserUserLogin, success: { (model) in
                SVProgressHUD.showErrorWithStatus("asdf")
                success()
            }) { (code) in
                SVProgressHUD.showErrorWithStatus("asdfasdfas")
                failInLogin()
            }
        }else{
            failInLogin()
        }
    }
    func loginOut(){
        //let token : (str:String,isHaveToken:Bool) = DatabaseUserDefaults.isHaveToken()
       
    }
    class func regist(phone:String,psw:String,code:String,success:SessionSuccessBlock,failure:SessionFailBlock) {
        
        let param =   TopModel.specialProcess(["phone":phone,"password":psw,"validate_code":code])

        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserUserRegist, success: { (model) in
    
            SVProgressHUD.showErrorWithStatus("asdf")
            }) { (code) in
            SVProgressHUD.showErrorWithStatus("asdfasdfas")
        }
    }
}
