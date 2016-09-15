//
//  LoginAndRegist.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
protocol LoginViewControllerDelegate:NSObjectProtocol{
    func loginSuccess()
    func loginCancel()
}
class LoginViewController: UIViewController {
    @IBOutlet var txtFldPhone: UITextField!
    @IBOutlet var txtFldPsw: UITextField!
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var btnForgetPsw: UIButton!
    @IBOutlet var btnRegist: UIButton!
    var delegate:LoginViewControllerDelegate?
    var fromInside=false

    @IBAction func showRegist(sender: AnyObject) {
        let aStroyBoardSource = UIStoryboard(name: "LoginAndRegist", bundle: nil)
        let reigistViewController=aStroyBoardSource.instantiateViewControllerWithIdentifier("ReigistViewController")
        if let  temp = reigistViewController as? RegistViewController{
            navigationController?.pushViewController(reigistViewController, animated: true)
            temp.isRegistView = true
        }
    }
    
    @IBAction func showResetPsw(sender: AnyObject) {
        let aStroyBoardSource = UIStoryboard(name: "LoginAndRegist", bundle: nil)
        let resetPswVc = aStroyBoardSource.instantiateViewControllerWithIdentifier("ReigistViewController")
        if let  temp = resetPswVc as? RegistViewController{
            navigationController?.pushViewController(temp, animated: true)
            temp.isRegistView = false
        }
    }
    
    @IBAction func tryLogin(sender: AnyObject) {
        UserModel.loginByPsw(txtFldPhone.text!, password:txtFldPsw.text! , success: {_ in
            if  let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
                if self.fromInside{
                    self.dismissViewControllerAnimated(true, completion: nil)
                    if (self.delegate != nil){
                        self.delegate!.loginSuccess()
                    }
                }else{
                    appDelegate.setRootViewControllerisTabbar()
                }
            }
        }) { _ in
            print("通过密码登陆失败")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if fromInside{
            navigationItem.rightBarButtonItem=UIButton.createBackButton("", action: #selector(LoginViewController.loginCancel),target:self)
        }
        drawView()
    }
    
    func  drawView(){
        btnLogin.layer.cornerRadius = 3;
        btnLogin.backgroundColor = UIColor.TopicColor()
        btnLogin.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnForgetPsw.setTitleColor(UIColor.ColorByRGB(153, G: 153, B:153 , A: 153), forState: UIControlState.Normal)
        btnRegist.setTitleColor(UIColor.ColorByRGB(153, G: 153, B:153 , A: 153), forState: UIControlState.Normal)
        
    }
    
    func loginCancel()  {
        if (delegate != nil){
            delegate!.loginCancel()
        }
        
    }
}
