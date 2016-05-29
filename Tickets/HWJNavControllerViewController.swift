//
//  HWJNavControllerViewController.swift
//  SuperGina
//
//  Created by apple on 15/8/2.
//  Copyright (c) 2015年 Anve. All rights reserved.
//

import UIKit

class HWJNavControllerViewController: UINavigationController {
//    有了该值后允许在HWJNavControllerViewController的当前页面是rootvc时执行dismissViewControllerAnimated
    var nzzWantDissmiss=false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    func popself() {
        if viewControllers.count>=2{
            popViewControllerAnimated(true)
        }else{
           dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool){
        if self.viewControllers.count == 0{
        viewController.navigationItem.backBarButtonItem = nil
        viewController.navigationItem.leftBarButtonItem =  UIButton.createBackButton("", action: #selector(HWJNavControllerViewController.popself), target: self)
        super.pushViewController(viewController, animated: animated)
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

extension HWJNavControllerViewController : UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool){
        title = viewController.title
    }
}
extension HWJNavControllerViewController : UIGestureRecognizerDelegate {
//    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
//        return flag
//    }
//    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool{
//        if self.viewControllers.count <= 1 {
//            return false
//        }else {
//            return true
//        }
//    }
}