//
//  UserModel.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
class UserModel: TopModel {
    var id = 0
    var session_id = ""
    var phone = ""
    var username = ""
    var job=""
    var test = 1
    var email = ""
    var avatar_url=""
    var id_card_no=""
    var password = ""
    var sign = 0
    private override init() {
        
    }
    static let shareManager = UserModel()
    //dohere正在做登陆，考虑用宏定义来给UserModel做一个单例，
//    func shareManager() -> UserModel {
//        static instance =
//        return
//    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        //        print("没有forUndefinedKey----value:\(value) key:\(key)");
    }
    class func loginByPsw(phone:String, password:String,success:SessionSuccessBlock,failure:SessionFailBlock) {
        let param = TopModel.specialProcess(["phone":phone,"password":password])
        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserUserLogin, success: { (model) in
            UserModel.shareManager.loginSuccess(model!)
            success(model: model)
        }) { (code) in
            failure(code: code)
        }
    }
    class func loginByToken(failNoToekn:()->Void,failInLogin:()->Void,success:()->Void){
        let token : (session_id:String,isHaveSession:Bool) = DatabaseUserDefaults.shareManager.isHaveSession_id()
        if token.isHaveSession{
            let param =   TopModel.specialProcess(["session_id":token.session_id])
            TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserUserInfo, success: { (model) in
                SVProgressHUD.showErrorWithStatus("登陆成功")
                UserModel.shareManager.loginSuccess(model!)
                success()
            }) { (code) in
                SVProgressHUD.showErrorWithStatus("登陆失败")
                
                failInLogin()
            }
        }else{
            failInLogin()
        }
    }
    func loginFail() {
//       DatabaseUserDefaults.shareManager.setSession_id("")
    }
    func loginOut(){
        //let token : (str:String,isHaveToken:Bool) = DatabaseUserDefaults.isHaveToken()
       
    }
    func  loginSuccess(model:AnyObject) {
        if let myDic = model as? Dictionary<String,AnyObject> {
            
            if let modelDic = myDic["result"] as? Dictionary<String,AnyObject> {
                UserModel.shareManager.setValuesForKeysWithDictionary(modelDic)
                DatabaseUserDefaults.shareManager.setSession_id(UserModel.shareManager.session_id)
            }
        }
    }
    class func regist(phone:String,psw:String,code:String,success:SessionSuccessBlock,failure:SessionFailBlock) {
        
        let param =   TopModel.specialProcess(["phone":phone,"password":psw,"validate_code":code])

        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserUserRegist, success: { (model) in
    
            SVProgressHUD.showErrorWithStatus("asdf")
            }) { (code) in
            SVProgressHUD.showErrorWithStatus("asdfasdfas")
        }
    }
    
    func signUp() {
        let param =  TopModel.specialProcess(["session_id":UserModel.shareManager.session_id]);
        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLTaskMarkMark, success: { (model) in
            SVProgressHUD.showErrorWithStatus("签到成功")
        }) { (code) in
//            SVProgressHUD.showErrorWithStatus("签到失败")
        }
    }
}
