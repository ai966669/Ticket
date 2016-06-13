//
//  CouponViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/5/25.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
import SnapKit

class CouponViewController: LoginNeedViewController {
    
    var tableView:UITableView!
    var couponTableView:CouponTableView!
    var ticket:Ticket!
    init(aTicket:Ticket){
        super.init(nibName: nil, bundle: nil)
        ticket=aTicket
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    func initView(){
        initTableView()
    }
    func initTableView(){
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
             make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        couponTableView=CouponTableView.init(aTicket: ticket, aTableView: tableView)
        tableView.delegate=couponTableView
        tableView.dataSource=couponTableView
        view.addSubview(tableView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
