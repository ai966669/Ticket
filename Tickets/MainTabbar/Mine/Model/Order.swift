//
//  Order.swift
//  Tickets
//
//  Created by ai966669 on 16/7/5.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class Order: NSObject {
    var title = ""
    var createTime = ""
    var totalScore = 0
    var uid = 0
    var code = ""
    var serialId = ""
    var bizSerialId = ""
    var image = ""
    var batchNo = ""
    var quantity = 0
    var phone = ""
    var status = 0
    var expireTime = ""
    var couponId = 0
    var id = 0
    override func setValue(value: AnyObject?, forKey key: String) {
        Log("\(key)值\(value)")
        super.setValue(value, forKey: key)
        Log("\(key)成功")
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        //        print("没有forUndefinedKey----value:\(value) key:\(key)");
    }
    
}
