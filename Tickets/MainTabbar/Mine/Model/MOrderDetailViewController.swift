//
//  MOrderDetailViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/7/5.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class MOrderDetailViewController: TopModel {
    var isFromCouponDetail:Bool = false
    var order:Order?
    init(isFromCouponDetail:Bool,aOrder:Order) {
        self.isFromCouponDetail = isFromCouponDetail
        order = aOrder
    }
    func  getCouponDetailById(success:(ticket:Ticket)->Void,fail:(code:Int)->Void){
        let param = TopModel.unverisalProcess(["couponId":"4"]);
        TopModel.universalRequest(requestMethod: Method.GET, dic: param, urlMethod: TKConfig.URLCouponCouponDetail, success: { (model) in
            if let rInDic = model!["result"]   as?  Dictionary<String,AnyObject> {
                if let ticket : Ticket = D3Json.jsonToModel(rInDic, clazz: Ticket.self){
                    success(ticket:ticket)
                }else{
                    SVProgressHUD.showInfoWithStatus(MsgShow.ErrAnalysisServerData2Dic);
                }
            }else{
                SVProgressHUD.showInfoWithStatus("返回数据有问题");
            }
        }) { (code) in
            SVProgressHUD.showInfoWithStatus("返回失败");
            fail(code: code)
        }
    }
}
