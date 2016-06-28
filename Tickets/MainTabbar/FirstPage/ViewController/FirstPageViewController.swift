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
    
//    func initPageControl(imgUrls:[NSURL]){
//        pageControl=UIPageControl.init(frame: CGRectMake((banner.frame.width-100)/2, banner.frame.height+banner.frame.origin.y-20-10, 100, 20))
//        pageControl.numberOfPages = imgUrls.count;
//        pageControl.currentPage = 0;
//        pageControl.hidesForSinglePage = true;
//        //        pageControl.backgroundColor = blackColor //[UIColor blackColor];
//        pageControl.addTarget(self, action: #selector(FirstPageViewController.pageControlChanged), forControlEvents:UIControlEvents.ValueChanged)
//        view.addSubview(pageControl)
//    }
//    func  initBanner(){
//        aMFirstPageTableView.getDataForBanner { [weak self]  () in
//            var imgUrls : [NSURL] = []
//            self!.links = []
//            if (self != nil && self!.aMFirstPageTableView.banners != nil){
//                for banner in self!.aMFirstPageTableView.banners{
//                    imgUrls.append(NSURL.init(string: banner.image)!)
//                    self!.links.append(NSURL.init(string: banner.url)!)
//                }
//            }
//            self!.banner = BannerInFirstPage.init(frame: CGRectMake(0, (self!.navigationController?.navigationBar.frame.height)!, ScreenW, 150), imgUrls:imgUrls)
//            self!.banner.delegate=self
//            self!.banner.bannerInFirstPageDelegate = self
//            self!.initPageControl(imgUrls)
//            self!.view.addSubview(self!.banner)
//            self!.initTableviewTicketFisrtPage()
//        }
//    }
    func initTableviewTicketFisrtPage(){
        aMFirstPageTableView.getDataForBanner { [weak self] () in
            self?.aMFirstPageTableView.getDataForTicketsList(1, doLater:  {  [weak self] in
                if (self != nil){
                    self!.tableviewTicketFisrtPage=UITableView.init(frame: CGRectMake(0, 0, ScreenW, ScreenH-HeightDefaultNavigationBar-HeightDefaultTabbar))
                    self!.view.addSubview(self!.tableviewTicketFisrtPage)
                    self!.firstPageTableView = FirstPageTableView.init(aMFirstPageTableView: self!.aMFirstPageTableView, tableView: self!.tableviewTicketFisrtPage)
                }
            })
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

extension FirstPageViewController:BannerInFirstPageDelegate{
    func clickOnIndex(index: Int) {
        let webVc = UniversialWebViewViewController.init(url: links[index]);navigationController?.pushViewController(webVc, animated: true)
    }
}