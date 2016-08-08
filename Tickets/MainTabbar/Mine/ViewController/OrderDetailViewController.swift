//
//  OrderDetailViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/7/2.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    var orderDetailTableView:OrderDetailTableView!
    var tableView:UITableView!
    var mOrderDetailViewController:MOrderDetailViewController!
    init(isFromCoponDetail:Bool,aOrder:Order){
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.whiteColor()
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            make.height.equalTo(350)
        }
        mOrderDetailViewController = MOrderDetailViewController.init(isFromCouponDetail: true, aOrder: aOrder)
        orderDetailTableView = OrderDetailTableView.init(aOrder: mOrderDetailViewController.order!, aTableView: tableView)
        orderDetailTableView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
//dohere。查看别人的有tableview的vc是如何分层的，datasource和delegate分别写在哪里，tableview的数据和vc的数据封装在哪里。如何分层可以达到以下两个目的1.一看就容易知道界面层和逻辑层代码是在哪里的，即各个类分工明确2.复用性高
extension OrderDetailViewController: OrderDetailTableViewDelegate{
    func  goCouponVc() {
        if(mOrderDetailViewController.isFromCouponDetail){
            self.navigationController?.popViewControllerAnimated(true)
        }else{
            mOrderDetailViewController.getCouponDetailById({ (ticket) in
                let aCouponViewController = CouponViewController.init(aTicket:ticket)
                self.navigationController?.pushViewController(aCouponViewController, animated: true)
                }, fail: { (code) in
                    
            })
        }
    }
}