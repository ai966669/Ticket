//
//  MCouponViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/6/12.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class MCouponViewController: TopModel {
    var ticket:Ticket!
    func shopNow(doLaterSuccess:(order:Order)->Void,doLaterFail:(code:Int) -> Void){
        let param = TopModel.unverisalProcess(["couponId":"\(ticket.id)"]);
        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLOrderOrderCreate, success: { (model) in
            if let rInDic = model!["result"]   as? Dictionary<String,AnyObject>{
                let order = Order()
                order.setValuesForKeysWithDictionary(rInDic) 
                doLaterSuccess(order:order)
            }else{
                SVProgressHUD.showInfoWithStatus("返回数据有问题");
            }
        }) { (code) in
            SVProgressHUD.showInfoWithStatus("返回失败");
            doLaterFail(code: code)
        }
        
    }
}
