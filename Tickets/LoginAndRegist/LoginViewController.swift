//
//  LoginAndRegist.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet var txtFldPhone: UITextField!
    
    @IBOutlet var txtFldPsw: UITextField!
    @IBAction func showRegist(sender: AnyObject) {
        let aStroyBoardSource = UIStoryboard(name: "LoginAndRegist", bundle: nil)
        let aReigistViewController=aStroyBoardSource.instantiateViewControllerWithIdentifier("ReigistViewController")
        self.navigationController?.pushViewController(aReigistViewController, animated: true)
    }
    @IBAction func tryLogin(sender: AnyObject) {
//        SVProgressHUD.showErrorWithStatus("asdf")
        UserModel.loginByPsw(txtFldPhone.text!, password:txtFldPsw.text! , success: {_ in 
            if  let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
                appDelegate.setRootViewControllerisTabbar()
            }
            }) { _ in
                   print("通过密码登陆失败")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.yellowColor()
    }
}
