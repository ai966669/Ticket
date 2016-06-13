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
    var aFirstPageTableDataSource:FirstPageTableDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()
        initBanner()
        // Do any additional setup after loading the view.
    }
    func initPageControl(imgUrls:[NSURL]){
        pageControl=UIPageControl.init(frame: CGRectMake((banner.frame.width-100)/2, banner.frame.height+banner.frame.origin.y-20-10, 100, 20))
        pageControl.numberOfPages = imgUrls.count;
        pageControl.currentPage = 0;
        pageControl.hidesForSinglePage = true;
        //        pageControl.backgroundColor = blackColor //[UIColor blackColor];
        pageControl.addTarget(self, action: #selector(FirstPageViewController.pageControlChanged), forControlEvents:UIControlEvents.ValueChanged)
        view.addSubview(pageControl)
    }
    func  initBanner(){
        aMFirstPageTableView.getDataForBanner { [weak self]  () in
            var imgUrls : [NSURL] = []
            if (self != nil && self!.aMFirstPageTableView.banners != nil){
                for banner in self!.aMFirstPageTableView.banners{
                    imgUrls.append(NSURL.init(string: banner.image)!)
                }
            }
            self!.banner = BannerInFirstPage.init(frame: CGRectMake(0, (self!.navigationController?.navigationBar.frame.height)!, ScreenW, ScreenH*0.3), imgUrls:imgUrls)
            self!.banner.delegate=self
            self!.initPageControl(imgUrls)
            self!.view.addSubview(self!.banner)
            self!.initTableviewTicketFisrtPage()
        }
 
    }
    func initTableviewTicketFisrtPage(){
//       var a = UIViewController.init()
        tableviewTicketFisrtPage=UITableView.init(frame: CGRectMake(0, banner.frame.height+banner.frame.origin.y, ScreenW, ScreenH-ScreenH*0.3-(self.navigationController?.navigationBar.frame.height)!-HeightTabbar))
        //dohere 如何更好地分层
        aMFirstPageTableView.getDataForTicketsList { () in
            self.aFirstPageTableDataSource=FirstPageTableDataSource.init(aMFirstPageTableView: self.aMFirstPageTableView)
            self.tableviewTicketFisrtPage.delegate=self
            self.tableviewTicketFisrtPage.dataSource=self.aFirstPageTableDataSource
            self.view.addSubview(self.tableviewTicketFisrtPage)
        }
    }
    func pageControlChanged()
    {
        //        banner.contentOffset=CGPointMake(CGFloat(pageControl.currentPage)*banner.frame.width, 0)
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
extension FirstPageViewController:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
extension FirstPageViewController:UITableViewDelegate{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 100;
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let aCouponViewController = CouponViewController.init(aTicket:self.aFirstPageTableDataSource.dataSource.tickets[indexPath.row])
        navigationController?.pushViewController(aCouponViewController, animated: true)
        print("点击\(indexPath.row)");
    }
}