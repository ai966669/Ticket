//
//  MUpToFile.swift
//  SuperGina
//
//  Created by huawenjie on 15/9/21.
//  Copyright © 2015年 anve. All rights reserved.
//

import UIKit

class MUpToFile: TopModel {
    class func upToFile(data: NSData,backInfo: QNUpCompletionHandler,fail:(()->Void)){
        
        var aQNUploadOption:QNUploadOption?
        aQNUploadOption=QNUploadOption(mime: nil, progressHandler: { (key, percent) -> Void in
            //            if aModelOfMsgCellImg.percent != Int(percent*100){
            //                aModelOfMsgCellImg.percent=Int(percent*100)
            //            }
            print("上传进度\(Int(percent*100))")
            }, params: nil, checkCrc: false, cancellationSignal: { () -> Bool in
                return false
        })
        
        var strUptoken = isNeedRequestToGetUptoken()
        //        查看是否有有效的牵牛token,没有
        
                strUptoken = "__vafSsRk-eaqDK1734Q1XxoRrcglFc2JOKGPlhD:DeIzQ2dCLn80hTG1i37eA15kJXU=:eyJzY29wZSI6Im1vcnRyZWQtZGV2IiwiZGVhZGxpbmUiOjE0NjQ3MTA2NDl9"
        if strUptoken == "" {
            getUptoken({ (upToken) -> Void in
                let upManager = QNUploadManager()
                let key = "\(getFileName())"
                
                upManager.putData(data, key: key, token: upToken, complete: {
                    
                    (info,key,resp) -> Void in
                    
                    backInfo(info,key,resp)
                    
                    }, option:nil)
                
            }) { () -> Void in
                NSUserDefaults.standardUserDefaults().removeObjectForKey(TKConfig.QiniuUpToken)
                NSUserDefaults.standardUserDefaults().removeObjectForKey(TKConfig.QiniuUpTokenTime)
                fail()
            }
        }
            //有token
        else{
            let key = "\(getFileName())"
            QNUploadManager().putData(data, key: key, token: strUptoken, complete: {
                
                (info,key,resp) -> Void in
                
                backInfo(info,key,resp)
                
                }, option:aQNUploadOption)
        }
    }
    
    
    class func getFileName() -> String {
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let unitFlags: NSCalendarUnit =  [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day]
        let comp = calendar!.components(unitFlags, fromDate: NSDate())
        comp.timeZone = NSTimeZone(name: "Asia/Shanghai")
        
        let year = String(comp.year)
        let month = String(comp.month)
        let day = String(comp.day)
        
        let uuid = CFUUIDCreate(nil)
        assert(uuid != nil, "uuid为空")
        let uuidStr = CFUUIDCreateString(nil, uuid) as String
        let newUuidStr = uuidStr.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil).lowercaseString
        
        return "i/\(year)/\(month)/\(day)/\(newUuidStr)"
    }
    
    //请求上传七牛Uptoken
    class func isNeedRequestToGetUptoken() ->String {
        if let strTime = NSUserDefaults.standardUserDefaults().objectForKey(TKConfig.QiniuUpTokenTime) as? String {
            let dateNow = NSDate()
            let dateformatter = NSDateFormatter()
            dateformatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
            if let date = dateformatter.dateFromString(strTime) {
                if dateNow.compare(date) == NSComparisonResult.OrderedAscending {
                    if let strUpToken = NSUserDefaults.standardUserDefaults().objectForKey(TKConfig.QiniuUpToken) as? String {
                        return strUpToken
                    }
                }
            }
        }
        return ""
    }
    
    //请求上传七牛Uptoken
    private class func getUptoken(doLaterSuccess:((upToken:String)->Void),doLaterFail:(()->Void)){
        MCommandRequest().getSystemUpToken({ (model) -> Void in
            if let rInDic = model as? Dictionary<String,AnyObject>{
                //                var  a=rInDic["result"]
                if let upTokenInDic = rInDic["result"] as? Dictionary<String,AnyObject>{
                    if let upToken = upTokenInDic["cdnToken"] as? String{
                        NSUserDefaults.standardUserDefaults().setValue(upTokenInDic, forKey: TKConfig.QiniuUpToken)
                        let date = NSDate(timeIntervalSinceNow: 24*60*60)
                        let dateformatter = NSDateFormatter()
                        dateformatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
                        let strDate = dateformatter.stringFromDate(date)
                        Log("Date\(strDate)")
                        NSUserDefaults.standardUserDefaults().setValue(strDate, forKey: TKConfig.QiniuUpTokenTime)
                        
                        doLaterSuccess(upToken: upToken)
                    }else{
                        SVProgressHUD.showErrorWithStatus(MsgShow.ErrAnalysisServerData2Dic)
                    }
                }else{
                    SVProgressHUD.showErrorWithStatus(MsgShow.ErrAnalysisServerData2Dic)
                }
            }else{
                SVProgressHUD.showErrorWithStatus(MsgShow.ErrAnalysisServerData2Dic)
            }
            
            }, failure: { (code) -> Void in
                doLaterFail()
        })
    }
}
