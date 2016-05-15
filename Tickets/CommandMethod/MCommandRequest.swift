//
//  MCommandRequest.swift
//  ChatVc
//
//  Created by ai966669 on 16/1/5.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class MCommandRequest: TopModel {
    func getSystemTime(success:SessionSuccessBlock,failure:SessionFailBlock)->NSURLSessionTask{
        let params=TopModel.unverisalProcess(Dictionary<String, String>())
        let request = TopModel.universalRequest(requestMethod:Method.GET,dic: params, urlMethod: URLSystemTime, success: { (model) -> Void in
            success(model: model)
            }) { (code) -> Void in
                failure(code: code)
        }
        return  request.task
    }
    
    func getSystemUpToken(success:SessionSuccessBlock,failure:SessionFailBlock)->NSURLSessionTask{
        let params=TopModel.unverisalProcess(Dictionary<String, String>())
        let request = TopModel.universalRequest(requestMethod:Method.GET,dic: params, urlMethod: TKConfig.URLIndexIndexConfig, success: { (model) -> Void in
            success(model: model)
            }) { (code) -> Void in
                failure(code: code)
        }
        return  request.task
    }
    
    func applicationStart(success:SessionSuccessBlock,failure:SessionFailBlock)->NSURLSessionTask{
        
        let aUIDevice=UIDevice.currentDevice()
        
        var net=""
//        let netInt=AFNetworkReachabilityManager.sharedManager().networkReachabilityStatus
        
//        switch (netInt) {
//        case .Unknown:
//            net="Unknown"
//        case .NotReachable:
//            net="NotReachable"
//        case .ReachableViaWWAN:
//            net="WWAN"
//        case .ReachableViaWiFi:
//            net="WiFi"
//        }
        
        let CFBundleShortVersionString=NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String

        
        var  params :Dictionary<String, String>=["deviceId":"\(HelpFromOc.getUUID())","deviceType":"\(aUIDevice.model)","os":"iOS","osVersion":"\(aUIDevice.systemVersion)","net":net,"appVersion":"\(CFBundleShortVersionString)"]
        
        params = TopModel.specialProcess([:])
        
        let request = TopModel.universalRequest(requestMethod: Method.POST,dic: params, urlMethod: TKConfig.URLIndexIndexConfig, success: { (model) -> Void in
            if let modelInDic = model as? Dictionary<String,AnyObject>{
                if let dataInDic = modelInDic["result"] as? Dictionary<String,AnyObject>{
//                    MUpToFile()
//                    let aMMenus:MUi = D3Json.jsonToModel(dataInDic, clazz: MUi.self)
//                    MUi.resetShareMMenus(aMMenus)
//                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    })
                }else{
                    SVProgressHUD.showErrorWithStatus(MsgShow.ErrAnalysisServerData2Dic)
                }
            }
            success(model: model)
            
            }) { (code) -> Void in
                failure(code: code)
        }
        
        return request.task
    }
    
    func getCode(cardNum:String,psw:String,success:SessionSuccessBlock,failure:SessionFailBlock)->NSURLSessionTask{
        let params = TopModel.specialProcess(["deviceId":(UIDevice.currentDevice().identifierForVendor?.UUIDString)!,"cardNum":cardNum,"password":psw])
        
        let request = TopModel.universalRequest(requestMethod: Method.POST,dic: params, urlMethod: URLUserCode, success: { (model) -> Void in
            success(model: model)
            
            }) { (code) -> Void in
                failure(code: code)
        }
        return request.task
    }
    func getSystemVersion(success:SessionSuccessBlock,failure:SessionFailBlock)->NSURLSessionTask{
        let params=TopModel.unverisalProcess(Dictionary<String, String>())
        let request = TopModel.universalRequest(requestMethod:Method.POST,dic: params, urlMethod: URLSystemVersion, success: { (model) -> Void in
            success(model: model)
            }) { (code) -> Void in
                failure(code: code)
        }
        return  request.task
    }
}
class SystemVersion : NSObject{
    var content = ""
    var url =  ""
    var title = ""
    var version = ""
    static var showed=false
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    func show(){
        if !SystemVersion.showed{
            SystemVersion.showed=true
            MCommandRequest().getSystemVersion({ (model) -> Void in
                if let myDic = model as? Dictionary<String,AnyObject>,
                    let dataInDic = myDic["data"] as? Dictionary<String,AnyObject>
                {
                    self.setValuesForKeysWithDictionary(dataInDic)
                    let CFBundleShortVersionString=NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
//                    if (CFBundleShortVersionString != self.version && self.version != UserDefaultsUtils.valueForKey("cancelButtonTitle")){
//                        let aUIAlertView=UIAlertView(title: self.title, message: self.content, delegate: self, cancelButtonTitle: "下次再说", otherButtonTitles: "去更新")
//                        aUIAlertView.show()
//                    }
                }
                }) { (code) -> Void in
                    
            }
        }
    }
    func showWhenNeed(){
        let aUIAlertView=UIAlertView(title: "下载新版本后才能使用该功能", message: self.content, delegate: self, cancelButtonTitle: "下次再说", otherButtonTitles: "去更新")
        aUIAlertView.show()
    }
}
extension SystemVersion:UIAlertViewDelegate{
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            print("去更新")
            UIApplication.sharedApplication().openURL(NSURL(string: "itms-apps://itunes.apple.com/cn/app/shen-zhu/id980572392?l=zh&ls=1&mt=8")!)
        }
        if buttonIndex == 0 {
            
//            UserDefaultsUtils.saveValue(self.version, forKey: "cancelButtonTitle")
        }
    }
}
