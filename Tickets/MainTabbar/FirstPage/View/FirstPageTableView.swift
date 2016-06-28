//
//  FirstPageTableView.swift
//
//
//  Created by ai966669 on 16/5/4.
//
//

import UIKit

class FirstPageTableView: NSObject{
    var dataSource:MFirstPageTableView?
    var tableViewCaller:UITableView!
    var bannerInFirstPage = BannerInFirstPage()
    var pageControl:UIPageControl!
    var cellBanner:UITableViewCell!
    init(aMFirstPageTableView:MFirstPageTableView,tableView:UITableView!) {
        super.init()
        tableViewCaller=tableView
        tableView.tableFooterView = UIView.init(frame: CGRectMake(0, 0, 0, 0))
        dataSource=aMFirstPageTableView
        initCellBanner()
        tableViewCaller.delegate = self
        tableViewCaller.dataSource = self
    }
    
    func initCellBanner() {
        cellBanner = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cellBannerId") //
        var imgUrls : [NSURL] = []
        var  bannerLinks : [NSURL] = []
        if (dataSource != nil) {
            for banner in dataSource!.banners{
                imgUrls.append(NSURL.init(string: banner.image)!)
                bannerLinks.append(NSURL.init(string: banner.url)!)
            }
            bannerInFirstPage.setImgUrls(bannerLinks)
            bannerInFirstPage.delegate=self
            bannerInFirstPage.bannerInFirstPageDelegate = self
            cellBanner.addSubview(bannerInFirstPage)
            bannerInFirstPage.snp_makeConstraints { (make) in
                make.top.left.bottom.right.equalTo(cellBanner.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            }
            initPageControl()
        }
    }
    
    func initPageControl() {
        pageControl = UIPageControl()
        bannerInFirstPage.addSubview(pageControl)
        bannerInFirstPage.snp_makeConstraints { (make) in
            make.centerX.equalTo(bannerInFirstPage)
            make.size.equalTo(CGSizeMake(100, 20))
            make.bottom.equalTo(bannerInFirstPage).offset(-20)
        }
        
        //        pageControl=UIPageControl.init(frame: CGRectMake((bannerInFirstPage.frame.width-100)/2, bannerInFirstPage.frame.height+bannerInFirstPage.frame.origin.y-20-10, 100, 20))
        pageControl.numberOfPages = dataSource!.banners.count;
        pageControl.currentPage = 0;
        pageControl.hidesForSinglePage = true;
        //        pageControl.backgroundColor = blackColor //[UIColor blackColor];
        pageControl.addTarget(self, action: #selector(FirstPageViewController.pageControlChanged), forControlEvents:UIControlEvents.ValueChanged)
    }
}

extension FirstPageTableView:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return ( indexPath.section == 0 ) ? 150:90;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let aCouponViewController = CouponViewController.init(aTicket:dataSource!.tickets[indexPath.row])
        HelpFromOc.getPresentedViewController().navigationController?.pushViewController(aCouponViewController, animated: true)
    }
    
    @objc func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (section == 0) ? 1 : dataSource!.tickets.count;
    }
    
    
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            return cellBanner
        }else{
            let cellId="FirstPageTableCell"
            
            let uiNibFirstPageTableViewCell=UINib(nibName: "FirstPageTableViewCell", bundle: NSBundle.mainBundle())
            
            tableView.registerNib(uiNibFirstPageTableViewCell, forCellReuseIdentifier: cellId)
            
            if let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as? FirstPageTableViewCell{
                cell.setCoupon(dataSource!.tickets[indexPath.row])
                return cell
            }else{
                return FirstPageTableViewCell()
            }
        }
        
    }
}
extension FirstPageTableView:BannerInFirstPageDelegate{
    func clickOnIndex(index: Int) {
        let webVc = UniversialWebViewViewController.init(url: NSURL.init(string: dataSource!.banners[index].url)!)
        HelpFromOc.getPresentedViewController().navigationController?.pushViewController(webVc, animated: true)
    }
}