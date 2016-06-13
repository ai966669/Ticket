//
//  UserModel.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
class UserModel: TopModel {
    var sessionId = ""
    var phone = ""
    var userName = ""
    var job=""
    var email = ""
    var avatarUrl=""
    var idCardNo=""
    var password = ""
    var hasMarked = 0
    var score = 0
    private override init() {
        
    }
    func toDic()->NSDictionary {
        let modelInDic:NSMutableDictionary=NSMutableDictionary()
        var outCount:UInt32=0
        let  properties=class_copyPropertyList(UserModel.self, &outCount)
        for k in 0...Int(outCount)-1{
            let  property=properties[k]
            let name =  String.fromCString(property_getName(property))
            if let value = self.valueForKey(name!){
                print("\(name!):\(value)")
                modelInDic[name!]="\(value)"
            }
        }
        return modelInDic
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
        resetData()
        if let appdelegate = UIApplication.sharedApplication().delegate as? AppDelegate{
            appdelegate.setRootViewControllerIsLogin()
        }
    }
    func resetData() {
        DatabaseUserDefaults.shareManager.setSessionId("")
        resetUserInfor()
    }
    func resetUserInfor(){
        sessionId = ""
         phone = ""
        userName = ""
        job=""
         email = ""
         avatarUrl=""
         idCardNo=""
         password = ""
         hasMarked = 0
         score = 0
    }
    func  loginSuccess(model:AnyObject) {
        if let myDic = model as? Dictionary<String,AnyObject> {
            
            if let modelDic = myDic["result"] as? Dictionary<String,AnyObject> {
                UserModel.shareManager.setValuesForKeysWithDictionary(modelDic)
                DatabaseUserDefaults.shareManager.setSessionId(UserModel.shareManager.sessionId)
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
        let param =  TopModel.specialProcess(["session_id":UserModel.shareManager.sessionId]);
        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLTaskMarkMark, success: { (model) in
            SVProgressHUD.showErrorWithStatus("签到成功")
        }) { (code) in
//            SVProgressHUD.showErrorWithStatus("签到失败")
        }
    }
    
    func update(){
        let param =  TopModel.unverisalProcess(self.toDic() as! Dictionary<String, String>)
        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserUserUpdate, success: { (model) in
            SVProgressHUD.showErrorWithStatus("签到成功")
        }) { (code) in
            SVProgressHUD.showErrorWithStatus("签到失败")
        }
    }
}
