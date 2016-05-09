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
    var tableviewTicketFisrtPage:UITableView!
    var aFirstPageTableDataSource:FirstPageTableDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()
        initBanner()
        initTableviewTicketFisrtPage()
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
        let imgUrls:[NSURL] = [ NSURL (string: "http://b.hiphotos.baidu.com/image/pic/item/b64543a98226cffc47102fb2bb014a90f603eafc.jpg")!,NSURL (string: "http://f.hiphotos.baidu.com/image/h%3D200/sign=b46522b25c82b2b7b89f3ec401accb0a/b2de9c82d158ccbf79a00f8c1cd8bc3eb1354163.jpg")!]
        banner = BannerInFirstPage.init(frame: CGRectMake(0, (navigationController?.navigationBar.frame.height)!, ScreenW, ScreenH*0.3), imgUrls:imgUrls)
        banner.delegate=self
        view.addSubview(banner)
        initPageControl(imgUrls)
    }
    func initTableviewTicketFisrtPage(){
        tableviewTicketFisrtPage=UITableView.init(frame: CGRectMake(0, banner.frame.height+banner.frame.origin.y, ScreenW, ScreenH-banner.frame.height-banner.frame.origin.y-HeightTabbar))
        MFirstPageTableView.getData { (aMFirstPageTableView) in
            self.aFirstPageTableDataSource=FirstPageTableDataSource.init(aMFirstPageTableView: aMFirstPageTableView)
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
        print("点击\(indexPath.row)");
    }
}