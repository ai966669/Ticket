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
    init(aMFirstPageTableView:MFirstPageTableView) {
        dataSource=aMFirstPageTableView
    }
}

extension FirstPageTableDataSource:UITableViewDataSource{
    
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
            cell.lblTitle!.text=dataSource.tickets[indexPath.row].title
            return cell
        }else{
            return FirstPageTableViewCell()
        }
        
    }
}
