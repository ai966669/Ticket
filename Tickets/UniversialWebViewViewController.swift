//
//  UniversialWebViewViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/6/24.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class UniversialWebViewViewController: UIViewController {
    var webView:UIWebView!
    private func initWvShow(url:NSURL){
        webView=UIWebView(frame: CGRectMake(0,0,view.frame.width,view.frame.height))
        webView.delegate = self
        let request = NSURLRequest.init(URL:url)
//            NSURL.init(string: "http://121.43.63.65/activity/activity/index")!)
        webView.loadRequest(request)
        view.addSubview(webView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init(aAmountOrigin:Double){
        super.init(nibName: "NZZVcOfPay", bundle: nil)
        //        amountOrigin = aAmountOrigin
    }
    
    init(url:NSURL){
        super.init(nibName: nil, bundle: nil)
        initWvShow(url)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
extension UniversialWebViewViewController:UIWebViewDelegate{
    
}
