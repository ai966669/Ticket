//
//  MFirstPageTableView.swift
//  Tickets
//
//  Created by ai966669 on 16/5/4.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
class Banner:NSObject {
    var image:String=""
    var id = -1
    var status = 1
    var url = ""
}

class Ticket:NSObject {
    var bussiness = "";
    var end_time = "";
    var id = -1;
    var image = ""
    var origin_storage = -1;
    var price : Double = 10;
    var start_time = ""
    var status = 1;
    var storage = -1
    var title = ""
}
class MFirstPageTableView: TopModel {
//    var ticketsTitle:[String] = []
//    var imgUrls:[NSURL] = [ NSURL (string: "http://b.hiphotos.baidu.com/image/pic/item/b64543a98226cffc47102fb2bb014a90f603eafc.jpg")!,NSURL (string: "http://f.hiphotos.baidu.com/image/h%3D200/sign=b46522b25c82b2b7b89f3ec401accb0a/b2de9c82d158ccbf79a00f8c1cd8bc3eb1354163.jpg")!]
    
    var banners:[Banner]!
    var tickets:[Ticket]!
    func getDataForTicketsList(doLater:()->Void){
        let param = TopModel.specialProcess(["page":1,"pagesize":10]);
        TopModel.universalRequest(requestMethod: Method.GET, dic: param, urlMethod: TKConfig.URLCouponCouponList, success: { (model) in
            
            if let rInDic = model!["result"]   as? Dictionary<String,AnyObject>{
                if let dataArr = rInDic["coupon_list"] as? NSArray {
                        if let ticketArr:[Ticket] = D3Json.jsonToModelList(dataArr, clazz: Ticket.self){
                            self.tickets = ticketArr
                        }
                }
            }
            doLater()
            SVProgressHUD.showInfoWithStatus("成功")
        }) { (code) in
            SVProgressHUD.showInfoWithStatus("失败")
        }
    }
    func getDataForBanner(doLater:()->Void){
        let param = TopModel.specialProcess([:]);
        TopModel.universalRequest(requestMethod: Method.GET, dic: param, urlMethod: TKConfig.URLBannerBannerList, success: { (model) in
            
//            aMFirstPageTableView.ticketsTitle=["购物卡1","购物卡2","购物卡5","购物卡3","购物卡1","购物卡2","购物卡5","购物卡3","购物卡1","购物卡2","购物卡5","购物卡3"]
//
//            doLater(aMFirstPageTableView: aMFirstPageTableView)
            
            
            if let rInDic = model!["result"]  as? Dictionary<String,AnyObject>{
                if let dataArr = rInDic["banner_list"] as? NSArray {
                    if let bannerArr:[Banner] = D3Json.jsonToModelList(dataArr, clazz: Banner.self){
                            self.banners = bannerArr
                    }
                }else{
                    
                }
            }
            doLater()
            SVProgressHUD.showInfoWithStatus("成功")
        }) { (code) in
            SVProgressHUD.showInfoWithStatus("失败")
        }
        
    }
}
