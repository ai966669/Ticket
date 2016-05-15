//
//  MineViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    
    @IBOutlet var imgViewUserImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initImgViewUserImg()
        // Do any additional setup after loading the view.
    }
    func initImgViewUserImg(){
        imgViewUserImg.sd_setImageWithURL(NSURL.init(string: "http://n.sinaimg.cn/translate/20160514/D-fj-fxsenvn7169391.jpg"), placeholderImage: UIImage.init(named: "candel.jpg")) { (img, err, nil, _) in
            if ((err) != nil){
                Log("sb\(err)")
            }
            print("cg")
        }
        let getsture=UITapGestureRecognizer .init(target: self, action: #selector(MineViewController.showInfor))
        getsture.numberOfTapsRequired=1
        getsture.numberOfTouchesRequired=1
        imgViewUserImg.addGestureRecognizer(getsture)
        imgViewUserImg.userInteractionEnabled=true
    }
    func showInfor(){
        let aUserInforViewControllera=UserInforViewController()
        self.navigationController?.pushViewController(aUserInforViewControllera, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginOut(sender: AnyObject) {
        if  let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                appDelegate.loginOutUnexpected("请重新登陆")
            })
        }
    }
    
    
    @IBAction func signUp(sender: AnyObject) {
        
        
        var data=UIImageJPEGRepresentation(UIImage.init(named: "candel.jpg")!, 1);
    MUpToFile.upToFile(data!, backInfo: { (_, _, _) in
        
        }) { 
            
        }
        
//        UserModel.shareManager.signUp()
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
