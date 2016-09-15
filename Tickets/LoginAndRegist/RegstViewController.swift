//
//  ReigistViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/5/8.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class RegistViewController: UIViewController {
    @IBOutlet var txtFldAcount: UITextField!
    @IBOutlet var txtFldPsw: UITextField!
    @IBOutlet var txtFldCode: UITextField!
    @IBOutlet var btnFinish: UIButton!
    @IBOutlet var btnGetCode: UIButton!
    var isRegistView:Bool = false;
    override func viewDidLoad() {
        super.viewDidLoad()
        drawView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TryRegist(sender: AnyObject) {
        if NZZCheckingOfInput.checkMobileNumber(txtFldAcount.text, showHUD: true){
            if NZZCheckingOfInput.checkNotNilOrNoValue(txtFldCode.text, showHUD: true, textToShow: "验证码不能为空"){
                if NZZCheckingOfInput.checkPassword(txtFldPsw.text, showHUD: true){
                    UserModel.regist(txtFldAcount.text!, psw: txtFldPsw.text!, code: txtFldCode.text!, success: { (failCode) in
                        
                    }) { (succes) in
                        
                    }
                }
            }
        }
    }
    
    @IBAction func codeRequest(sender: AnyObject) {
        if NZZCheckingOfInput.checkMobileNumber(txtFldAcount.text, showHUD: true){
            CodeRequest.askCodeRegist(txtFldAcount.text!, success: { (model) in
                    SVProgressHUD.showInfoWithStatus("验证码获取成功")
                }, failure: { (code) in
                    SVProgressHUD.showInfoWithStatus("验证码获取失败")
            })
        }
    }
    
//dohere继续制作，完成注册和登陆基本功能    
    func  drawView(){
        if isRegistView {
            btnFinish.setTitle("完成", forState: UIControlState.Normal)
        }
        btnFinish.layer.cornerRadius = 3
        btnFinish.backgroundColor = UIColor.TopicColor()
        btnFinish.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnGetCode.layer.cornerRadius = 3;
        btnGetCode.backgroundColor = UIColor.TopicColor()
        btnGetCode.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
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
