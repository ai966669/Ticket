//
//  MFirstPageTableView.swift
//  Tickets
//
//  Created by ai966669 on 16/5/4.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class MFirstPageTableView: NSObject {
    var ticketsTitle:[String] = []
    class func getData(doLater:(aMFirstPageTableView:MFirstPageTableView)->Void){
        let aMFirstPageTableView=MFirstPageTableView()
        aMFirstPageTableView.ticketsTitle=["购物卡1","购物卡2","购物卡5","购物卡3","购物卡1","购物卡2","购物卡5","购物卡3","购物卡1","购物卡2","购物卡5","购物卡3"]
        doLater(aMFirstPageTableView: aMFirstPageTableView)
    }
}
