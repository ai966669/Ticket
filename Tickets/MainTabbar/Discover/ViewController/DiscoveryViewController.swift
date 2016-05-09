//
//  DiscoeryViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController {
    var webView:UIWebView!
    var aUISegmentedControl:UISegmentedControl!
    var scrollDiscory:UIScrollView!
    private func initWvShow(){
        webView=UIWebView(frame: CGRectMake(0,0,view.frame.width,view.frame.height))
        webView.delegate = self
////        webView.backgroundColor = UIColor.ColorNav()
//        let request = NSMutableURLRequest(URL:NSURL.init(string: "www.baidu.com")!)
//        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.HTTPMethod = "POST"
//        let customAllowedSet =  NSCharacterSet(charactersInString:"`#%^{}\"[]|\\<> +").invertedSet
//        paramsInStr=paramsInStr.stringByAddingPercentEncodingWithAllowedCharacters(customAllowedSet)!
//        request.HTTPBody = paramsInStr.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        var request = NSURLRequest.init(URL: NSURL.init(string: "http://www.youku.com")!)
        webView.loadRequest(request)
        view.addSubview(webView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initWvShow()
//        initNavigationBar()
//        initScrollDiscory()
        // Do any additional setup after loading the view.
    }
    func initScrollDiscory(){
        
    }
    func initNavigationBar(){
        if let tabBarController = tabBarController{
            aUISegmentedControl=UISegmentedControl.init(items: ["热门活动","理财超市","每日任务"])
            aUISegmentedControl.frame=CGRectMake((ScreenW-120)/2, 0, 120, 50)
            aUISegmentedControl.tintColor=UIColor.blueColor()
            aUISegmentedControl.backgroundColor=UIColor.blueColor()
            tabBarController.navigationItem.titleView=aUISegmentedControl
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        aUISegmentedControl.hidden=true
//    }
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        aUISegmentedControl.hidden=false
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DiscoveryViewController:UIWebViewDelegate{
    
}