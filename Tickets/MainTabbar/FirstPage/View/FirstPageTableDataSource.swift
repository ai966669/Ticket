//
//  FirstPageTableDataSource.swift
//  
//
//  Created by ai966669 on 16/5/4.
//
//

import UIKit

class FirstPageTableDataSource: NSObject{
    var dataSource:MFirstPageTableView!
    var tableViewCaller:UITableView!
    init(aMFirstPageTableView:MFirstPageTableView,tableView:UITableView!) {
        tableViewCaller=tableView
        tableView.tableFooterView = UIView.init(frame: CGRectMake(0, 0, 0, 0))
        dataSource=aMFirstPageTableView
    }
}

extension FirstPageTableDataSource:UITableViewDataSource,UITableViewDelegate{
  
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 90;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let aCouponViewController = CouponViewController.init(aTicket:dataSource.tickets[indexPath.row])
        HelpFromOc.getPresentedViewController().navigationController?.pushViewController(aCouponViewController, animated: true)
    }
    
    @objc func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.tickets.count;
    }
    
    
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId="FirstPageTableCell"
        
        let uiNibFirstPageTableViewCell=UINib(nibName: "FirstPageTableViewCell", bundle: NSBundle.mainBundle())
        
        tableView.registerNib(uiNibFirstPageTableViewCell, forCellReuseIdentifier: cellId)
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as? FirstPageTableViewCell{
            cell.setCoupon(dataSource.tickets[indexPath.row])
            return cell
        }else{
            return FirstPageTableViewCell()
        }
        
    }
}
