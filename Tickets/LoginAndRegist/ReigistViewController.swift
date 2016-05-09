//
//  ReigistViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/5/8.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class ReigistViewController: UIViewController {
    @IBOutlet var txtFldAcount: UITextField!
    @IBOutlet var txtFldPsw: UITextField!
    @IBOutlet var txtFldCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func TryRegist(sender: AnyObject) {
        UserModel.regist(txtFldAcount.text!, psw: txtFldPsw.text!, code: txtFldCode.text!, fail: { (failCode) in
        
            }) { (succes) in
                
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
