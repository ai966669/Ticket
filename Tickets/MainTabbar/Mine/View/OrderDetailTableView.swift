//
//  OrderDetailTableView.swift
//  Tickets
//
//  Created by ai966669 on 16/7/4.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

protocol OrderDetailTableViewDelegate {
    func goCouponVc();
}
class OrderDetailTableView: NSObject,UITableViewDataSource,UITableViewDelegate{
    var order:Order!
    var orderDetailHeadViewCell:UITableViewCell!
    var orderDetailSucessInforCell:UITableViewCell!
    var tableViewO:UITableView!
    var delegate:OrderDetailTableViewDelegate?
    init(aOrder:Order,aTableView:UITableView) {
        super.init()
        order=aOrder
        tableViewO = aTableView
        tableViewO.dataSource=self
        tableViewO.delegate=self
        tableViewO.tableFooterView  = UIView()
        initOrderDetailHeadViewCell()
        initOrderDetailSucessInforCell()
    }
    
    func initOrderDetailHeadViewCell(){
        orderDetailHeadViewCell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "OrderDetailHeadViewCellId")
        orderDetailHeadViewCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        orderDetailHeadViewCell.selectionStyle = UITableViewCellSelectionStyle.None
        orderDetailHeadViewCell.imageView?.sd_setImageWithURL(NSURL.init(string: order.image))
        orderDetailHeadViewCell.textLabel?.text = order.title
    }
    
    func initOrderDetailSucessInforCell(){
        orderDetailSucessInforCell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "OrderDetailSucessInforCell")
        let orderdetail = OrderDetailView()
        orderDetailSucessInforCell.selectionStyle = UITableViewCellSelectionStyle.None
        orderDetailSucessInforCell.contentView.addSubview(orderdetail)
        orderdetail.snp_makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(orderDetailSucessInforCell.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        orderdetail.setOrder(order)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (indexPath.row == 0) ? 90 :166
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if (cell .respondsToSelector(Selector("setSeparatorInset:"))){
            cell.separatorInset = UIEdgeInsetsZero
        }
        if (cell .respondsToSelector(Selector("setPreservesSuperviewLayoutMargins:"))){
            cell.preservesSuperviewLayoutMargins = false
        }
        if (cell .respondsToSelector(Selector("setLayoutMargins:"))){
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return orderDetailHeadViewCell
        }else{
            return orderDetailSucessInforCell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 0){
            if ((delegate) != nil){
                delegate?.goCouponVc()
            }
        }
    }
   
}
