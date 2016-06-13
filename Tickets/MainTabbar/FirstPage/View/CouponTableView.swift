//
//  CouponTableView.swift
//  Tickets
//
//  Created by ai966669 on 16/6/12.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class CouponTableView: NSObject,UITableViewDelegate,UITableViewDataSource{
    var ticket:Ticket!
    var tableViewO:UITableView!
    var coponTableViewHeadView:CoponTableViewHeadView!
    init(aTicket:Ticket,aTableView:UITableView) {
        super.init()
        ticket=aTicket
        tableViewO = aTableView
        coponTableViewHeadView = CoponTableViewHeadView()
        coponTableViewHeadView.setValue(aTicket)
//        var  a=UIView.init(frame: CGRectMake(0, 0, ScreenW, 100))
//        a.backgroundColor=UIColor.yellowColor()
        tableViewO.tableHeaderView=coponTableViewHeadView;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  2 //ticket.descriptions.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell =  tableView.dequeueReusableCellWithIdentifier("CouponTableViewCell")
        
        if (cell == nil){
            cell = CoupnDescriptionsTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "CouponTableViewCell")
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
