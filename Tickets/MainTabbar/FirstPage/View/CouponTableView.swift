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
    var footView:UIView!
    init(aTicket:Ticket,aTableView:UITableView) {
        super.init()
        ticket=aTicket
        tableViewO = aTableView
        tableViewO.separatorStyle = UITableViewCellSeparatorStyle.None
        coponTableViewHeadView = CoponTableViewHeadView()
        coponTableViewHeadView.setValue(aTicket)
        tableViewO.tableHeaderView=coponTableViewHeadView;
        initFootView()
    }
    
    func initFootView(){
        footView =  UIView.init(frame: CGRectMake(0, 0, ScreenW, 60))
        footView.backgroundColor = UIColor.yellowColor()
        let btnShop = UIButton()
        footView.addSubview(btnShop)
        btnShop.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(0.4 * ScreenW, 40))
            make.centerX.centerY.equalTo(footView)
        }
        btnShop.backgroundColor = UIColor.redColor()
        btnShop.addTarget(self, action: #selector(CouponTableView.tryShop), forControlEvents: UIControlEvents.TouchUpInside)
        btnShop.setTitle("我要消费", forState: UIControlState.Normal)
    }
    
    func tryShop(){
        print("asds");
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return   ticket.descriptions.count
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footView.frame.height
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footView
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell =  tableView.dequeueReusableCellWithIdentifier("CouponTableViewCell")
        if (cell == nil){
            cell = CoupnDescriptionsTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "CouponTableViewCell")
        }
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        if (cell is CoupnDescriptionsTableViewCell) {
            (cell as! CoupnDescriptionsTableViewCell).setDescription(ticket.descriptions[indexPath.row])
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
