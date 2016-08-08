//
//  FirstPageViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {
    var banner:BannerInFirstPage!
    var pageControl:UIPageControl!
    var aMFirstPageTableView=MFirstPageTableView()
    var tableviewTicketFisrtPage:UITableView!
    var firstPageTableView:FirstPageTableView!
    var links:[NSURL]!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableviewTicketFisrtPage()
        // Do any additional setup after loading the view.
    }
    
    func initTableviewTicketFisrtPage(){
        aMFirstPageTableView.getDataForBanner { [weak self] () in
            self?.aMFirstPageTableView.getDataForTicketsList(1, doLater:  {  [weak self] in
                if (self != nil){
                    self!.tableviewTicketFisrtPage=UITableView.init(frame: CGRectMake(0,HeightDefaultNavigationBar, ScreenW, ScreenH-HeightDefaultNavigationBar-HeightDefaultTabbar))
                    self!.view.addSubview(self!.tableviewTicketFisrtPage)
                    self!.firstPageTableView = FirstPageTableView.init(aMFirstPageTableView: self!.aMFirstPageTableView, tableView: self!.tableviewTicketFisrtPage)
                }
            })
        }
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
