//
//  ImgDownloadQueen.swift
//  HK
//
//  Created by ai966669 on 16/3/28.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class ImgDownloadQueen: NSObject {
    var aInt=1
    private override init() {
        
    }
    static let shareInstance = ImgDownloadQueen()
    
    var imgVForDownLoad=UIImageView(frame: CGRectMake(0,0,0,0))

    var msgsUrl:[NSURL]?
    func insertQuenen(imgUrlStr:String,doLater: (img:UIImage)->Void){
        if imgUrlStr != ""{
            if msgsUrl?.count == 0{
               msgsUrl?.append(NSURL(string:imgUrlStr)!)
            }else{
                msgsUrl?.append(NSURL(string:imgUrlStr)!)
            }
        }
    }
    private func downLoadImg(nub:Int,doLater:(img:UIImage)->Void){
        self.imgVForDownLoad.sd_setImageWithURL(msgsUrl![nub], completed:{ ( aImg, aNSError,_, imageURL) -> Void in
            if (aNSError == nil){
                print("取：\(imageURL)")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    doLater(img: aImg)
                    if nub<self.msgsUrl!.count-1{
                        print("准备对\(nub+1)操作")
                        self.downLoadImg(nub+1,doLater: doLater)
                    }else{
                        self.msgsUrl=[]
                        print("初始化")
                        return
                    }
                })
            }
        })
    }
//
//        
//        if let aRCImageMessage = msgs[nub].content as? RCImageMessage{
//            self.imgVForDownLoad.sd_setImageWithURL(NSURL(string:"\(HKConfig.UrlImgSource)"+aRCImageMessage.imageUrl+"?imageMogr2/size-limit/20k"), completed:{ ( aImg, aNSError,_, imageURL) -> Void in
//                if (aNSError == nil){
//                    print("取：\(imageURL)")
//                    if let imgData =  UIImageJPEGRepresentation(aImg, 1){
//                        let path = msgIdToFilePath(self.msgs[nub].messageId, isVoice: false)
//                        //将图片保存到本地image文件夹下
//                        imgData.writeToFile(path, atomically: true)
//                        var str=imageURL.absoluteString
//                        str=(str as NSString).substringWithRange(NSRange(location: 0,length: (str as NSString).length-15))
//                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                            doWhenImgMsgLater(msg: self.msgs[nub])
//                            if nub<self.msgs.count-1{
//                                print("准备对\(nub+1)操作")
//                                self.downLoadImg(nub+1,doWhenImgMsgLater: doWhenImgMsgLater)
//                            }else{
//                                self.msgs=[]
//                                print("初始化")
//                                return
//                            }
//                        })
//                    }
//                }
//            })
//        }else{
//            if nub<self.msgs.count-1{
//                print("准备对\(nub+1)操作")
//                self.downLoadImg(nub+1,doWhenImgMsgLater: doWhenImgMsgLater)
//            }else{
//                self.msgs=[]
//                print("初始化")
//                return
//            }
//        }
//    }

    
    
//    private func downLoadImg(nub:Int,doWhenImgMsgLater:(msg:RCMessage)->Void){
//        if let aRCImageMessage = msgs[nub].content as? RCImageMessage{
//            self.imgVForDownLoad.sd_setImageWithURL(NSURL(string:"\(HKConfig.UrlImgSource)"+aRCImageMessage.imageUrl+"?imageMogr2/size-limit/20k"), completed:{ ( aImg, aNSError,_, imageURL) -> Void in
//                if (aNSError == nil){
//                    print("取：\(imageURL)")
//                    if let imgData =  UIImageJPEGRepresentation(aImg, 1){
//                        let path = msgIdToFilePath(self.msgs[nub].messageId, isVoice: false)
//                        //将图片保存到本地image文件夹下
//                        imgData.writeToFile(path, atomically: true)
//                        var str=imageURL.absoluteString
//                        str=(str as NSString).substringWithRange(NSRange(location: 0,length: (str as NSString).length-15))
//                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                            doWhenImgMsgLater(msg: self.msgs[nub])
//                            if nub<self.msgs.count-1{
//                                print("准备对\(nub+1)操作")
//                                self.downLoadImg(nub+1,doWhenImgMsgLater: doWhenImgMsgLater)
//                            }else{
//                                self.msgs=[]
//                                print("初始化")
//                                return
//                            }
//                        })
//                    }
//                }
//            })
//        }else{
//            if nub<self.msgs.count-1{
//                print("准备对\(nub+1)操作")
//                self.downLoadImg(nub+1,doWhenImgMsgLater: doWhenImgMsgLater)
//            }else{
//                self.msgs=[]
//                print("初始化")
//                return
//            }
//        }
//    }
}
