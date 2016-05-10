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
        UserModel.loginByPsw(txtFldPsw.text!, password: txtFldPhone.text!, failInLogin: {
                print("通过密码登陆失败")
            }) { 
                print("通过密码登陆成功")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.yellowColor()
    }
}
