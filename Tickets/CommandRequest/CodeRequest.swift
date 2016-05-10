//
//  CodeRequest.swift
//  Tickets
//
//  Created by ai966669 on 16/5/10.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class CodeRequest: TopModel {
    class func askCodeReset(phone:String,success:SessionSuccessBlock,failure:SessionFailBlock) {
        let param = TopModel.specialProcess(["phone":phone]);
        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserValidateReset, success: { (model) in
            success(model: model)
        }) { (code) in
            failure(code: code)
        }
    }
    class func askCodeRegist(phone:String,success:SessionSuccessBlock,failure:SessionFailBlock) {
        let param = TopModel.specialProcess(["phone":phone]);
        TopModel.universalRequest(requestMethod: Method.POST, dic: param, urlMethod: TKConfig.URLUserValidateRegist, success: { (model) in
            success(model: model)
        }) { (code) in
            failure(code: code)
        }
    }
}
