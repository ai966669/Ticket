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
    var delegate:LoginViewControllerDelegate!
    var fromInside=false
    @IBAction func showRegist(sender: AnyObject) {
        let aStroyBoardSource = UIStoryboard(name: "LoginAndRegist", bundle: nil)
        let aReigistViewController=aStroyBoardSource.instantiateViewControllerWithIdentifier("ReigistViewController")
        self.navigationController?.pushViewController(aReigistViewController, animated: true)
    }
    @IBAction func tryLogin(sender: AnyObject) {
        UserModel.loginByPsw(txtFldPhone.text!, password:txtFldPsw.text! , success: {_ in
            if  let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
                if self.fromInside{
                    self.dismissViewControllerAnimated(true, completion: nil)
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
        view.backgroundColor=UIColor.yellowColor()
    }
    func loginCancel()  {
        delegate.loginCancel()
    }
}
