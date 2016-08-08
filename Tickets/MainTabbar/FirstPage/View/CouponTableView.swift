//
//  CouponTableView.swift
//  Tickets
//
//  Created by ai966669 on 16/6/12.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

protocol CouponTableViewDelegate {
    func tryShop(ticket:Ticket);
}

class CouponTableView: NSObject,UITableViewDelegate,UITableViewDataSource{
    var ticket:Ticket!
    var tableViewO:UITableView!
    var coponTableViewHeadView:CoponTableViewHeadView!
    var footView:UIView!
    var cellHeadView:UITableViewCell!
    var couponTableViewDelegate:CouponTableViewDelegate?
    init(aTicket:Ticket,aTableView:UITableView) {
        super.init()
        ticket=aTicket
        initcellHeadView()
        initFootView()
        tableViewO = aTableView
        tableViewO.delegate=self
        tableViewO.dataSource=self
        tableViewO.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    
    func initcellHeadView() {
        cellHeadView = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cellHeadViewId")
        cellHeadView.selectionStyle = UITableViewCellSelectionStyle.None
        coponTableViewHeadView = CoponTableViewHeadView.init(frame: CGRectMake(0, 0, ScreenW, 375))//()
        cellHeadView.contentView.addSubview(coponTableViewHeadView)
        coponTableViewHeadView.setValue(ticket)
    }
    
    
    func initFootView(){
        footView =  UIView.init(frame: CGRectMake(0, 0, ScreenW, 60))
        footView.backgroundColor = UIColor.clearColor()
        let btnShop = UIButton()
        footView.addSubview(btnShop)
        btnShop.snp_makeConstraints { (make) in
            make.height.equalTo(37)
            make.centerX.equalTo(footView)
            make.left.equalTo(footView).offset(14)
            make.bottom.equalTo(footView).offset(-12)
        }
        btnShop.backgroundColor = UIColor.TopicColor()
        btnShop.addTarget(self, action: #selector(CouponTableView.tryShop), forControlEvents: UIControlEvents.TouchUpInside)
        btnShop.setTitle("立即兑换", forState: UIControlState.Normal)
    }
    
    func tryShop(){
        if(couponTableViewDelegate != nil){
            couponTableViewDelegate!.tryShop(ticket)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  ticket.descriptions.count + 1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footView.frame.height
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? coponTableViewHeadView.heightAll : 100
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return cellHeadView
        }else{
            var cell =  tableView.dequeueReusableCellWithIdentifier("CouponTableViewCell")
            if (cell == nil){
                cell = CoupnDescriptionsTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "CouponTableViewCell")
            }
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
            if (cell is CoupnDescriptionsTableViewCell) {
                (cell as! CoupnDescriptionsTableViewCell).setDescription(ticket.descriptions[indexPath.row-1])
            }
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
