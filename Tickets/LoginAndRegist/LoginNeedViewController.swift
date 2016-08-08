//
//  LoginNeedViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/5/25.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class LoginNeedViewController: UIViewController {
    var navLoginViewController:UINavigationController?
    var doAfterLogin:(()->Void)!
    var doLoginCancel:(()->Void)!
    func dissmissLoginVcSuccess(){
        if (navLoginViewController != nil){
            if (doAfterLogin != nil){
                doAfterLogin()
            }
            navLoginViewController!.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    init() {
        
        super.init(nibName: nil, bundle: nil)
//        super.init()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func dissmissLoginVcCancel(){
        if (navLoginViewController != nil){
            if (doLoginCancel != nil){
                doLoginCancel()
            }
            navLoginViewController!.dismissViewControllerAnimated(true, completion: nil)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    func createLoginViewControllerFromInside()->LoginViewController{
        let aStroyBoardSource = UIStoryboard(name: "LoginAndRegist", bundle: nil)
        let aLoginViewController:LoginViewController?=aStroyBoardSource.instantiateViewControllerWithIdentifier("LoginViewController") as?  LoginViewController
        aLoginViewController!.fromInside=true
        aLoginViewController?.delegate=self
        return aLoginViewController!
    }
    func checkLogin(doAfterLogin:()->Void){
        if UserModel.shareManager.phone != ""{
            self.doAfterLogin=doAfterLogin;
            navLoginViewController =  UINavigationController(rootViewController: createLoginViewControllerFromInside())
            self.presentViewController(navLoginViewController!, animated: true, completion: nil)
        }else{
            doAfterLogin()
        }
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
extension LoginNeedViewController:LoginViewControllerDelegate{
    func loginSuccess(){
        doAfterLogin()
    }
    func loginCancel(){
        navLoginViewController?.dismissViewControllerAnimated(true, completion: nil)
        navigationController?.popViewControllerAnimated(true)
        SVProgressHUD.showInfoWithStatus("请先登录")
    }
}