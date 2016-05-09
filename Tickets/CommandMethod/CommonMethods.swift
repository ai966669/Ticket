
//
//  Local.swift
//  SuperGina
//
//  Created by huawenjie on 15/8/24.
//  Copyright (c) 2015年 anve. All rights reserved.
//

import Foundation

func local(closure: ()->()) {
    closure()
}

func Log<T>(message: T) {
//    #if DEBUG
        print("\(message)")
//    #endif
}
//class SwiftValue : NSObject{
//    class func getRCIMAppKey()->String{
//        return HKConfig.RCIMAppKey
//    }
//    class func getBaseURL()->String{
//        return HKConfig.BaseURL
//    }
//    class func getNotificationChangeAvator()->String{
//        return HKConfig.NotificationChangeAvator
//    }
//    class func getDefaultHeadImgUser()->String{
//        return HKConfig.DefaultHeadImgUser
//    }
//}

func customSnapshot(fromView inputView: UIView) -> UIView {
    
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0)
    inputView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    let snapshot = UIImageView(image: image)
    snapshot.layer.masksToBounds = false
    snapshot.layer.cornerRadius = 0.0
    snapshot.layer.shadowOffset = CGSizeMake(0.0, 5.0)
    snapshot.layer.shadowRadius = 5.0
    snapshot.layer.shadowOpacity = 0.4
    
    return snapshot
    
    
}

func checkDevice(string: String) -> Bool {
    let deviceType = UIDevice.currentDevice().model
    if deviceType.componentsSeparatedByString(string).count > 0 {
        return true
    }else {
        return false
    }
}
//func isHaveToken() -> (String,Bool){
//    if let token = NSUserDefaults.standardUserDefaults().valueForKey(HKConfig.UD_LastTimeSignToken) as? String {
//            if token != ""  {
//                return (token,true)
//            }
//    }
//    return ("",false)
//}

//
//
//func isHavePsw() -> (String,Bool){
//    //判断是否有保存密码的依据是NSUserDefaults中对SG_LastIsHavePsw的维护
//    if let str = NSUserDefaults.standardUserDefaults().valueForKey(HKConfig.SG_LastIsHavePsw) as? String {
//        if str != "" {
//            return (str,true)
//        }
//    }
//    return ("",false)
//}
//func isHavePhone() -> (String,Bool){
//    //判断是否有保存密码的依据是NSUserDefaults中对SG_LastIsHavePsw的维护
//    if let str = NSUserDefaults.standardUserDefaults().valueForKey(HKConfig.SG_LastIsHavePhone) as? String {
//        if str != "" {
//            return (str,true)
//        }
//    }
//    return ("",false)
//}
/**
 通过融云的消息id和文件类型获取到文件地址
 
 - parameter msgId:   融云的消息id，唯一
 - parameter isVoice: 是否为语音消息
 
 - returns: 文件地址
 */
//func msgIdToFilePath(msgId:Int,isVoice:Bool)->String{
//
//    if isVoice{
//        return     HelpFromOc.getMsgPath("\(UserModel.shareManager.id)_Voice\(msgId)", false)
//    }else{
//        return     HelpFromOc.getMsgPath("\(UserModel.shareManager.id)_Img\(msgId)", false)
//    }
//}
/**
 获取document中的文件路径，如果没有则从资源库中拷贝
 
 - parameter fileNameInBundle: 资源文件名
 - parameter fileType:         资源类型
 
 - returns: 返回document路径
 */
func getDocumentFilePath(fileNameInBundle:String,fileType:String)->String{
    let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as NSArray
    let documentsDirectory =       paths[0] as! String
    let pathPlist = documentsDirectory.stringByAppendingString("/\(fileNameInBundle)"+".\(fileType)")
    let fileManager=NSFileManager.defaultManager()
    if (!fileManager.fileExistsAtPath(pathPlist)){
        if let bundlePath = NSBundle.mainBundle().pathForResource(fileNameInBundle, ofType: "plist") {
            do{
                let rCopy=try! fileManager.copyItemAtPath(bundlePath, toPath: pathPlist)
                print("拷贝结果\(rCopy)")
            }
            print("copy")
        } else {
            print("GameData.plist not found. Please, make sure it is part of the bundle.")
        }
    } else {
        print("/\(fileNameInBundle)"+".\(fileType) already exits at path.")
        // use this to delete file from documents directory
        //fileManager.removeItemAtPath(path, error: nil)
    }
    return pathPlist
}