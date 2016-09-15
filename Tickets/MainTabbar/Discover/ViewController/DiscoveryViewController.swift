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
    var scrollDiscory:UIScrollView!
    private func initWvShow(){
        webView=UIWebView(frame: CGRectMake(0,0,view.frame.width,view.frame.height))
        webView.delegate = self
        let request = NSURLRequest.init(URL: NSURL.init(string: "http://121.43.63.65/activity/activity/index")!)
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
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true,animated: animated)
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
extension DiscoveryViewController:UIWebViewDelegate{
    
}