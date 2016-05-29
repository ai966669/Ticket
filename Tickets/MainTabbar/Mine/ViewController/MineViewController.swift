//
//  MineViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class MineViewController: UIViewController  {
    
    @IBOutlet var imgViewUserImg: UIImageView!
    @IBOutlet var viewHalfBackgroundBefore: UIView!
    
    var tabelView:UITableView!
    var cellTitles=[["我的活动","我的券吧"],["关于我们"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.lightGrayColor()
        initImgViewUserImg()
        initTableview()
        // Do any additional setup after loading the view.
    }
    func initTableview(){
        tabelView=UITableView.init(frame: CGRectMake(0, viewHalfBackgroundBefore.frame.height+viewHalfBackgroundBefore.frame.origin.y+20, ScreenW, ScreenH))
        tabelView.tableFooterView=UIView.init(frame: CGRectMake(0, 0, 0, 0))
        tabelView.delegate=self
        tabelView.dataSource=self
        tabelView.backgroundColor=UIColor.clearColor()
        view.addSubview(tabelView)
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
extension MineViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section==0 ? 2 : 1
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section==0 ? 30 : 0
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view=UIView.init(frame: CGRectMake(0, 0, 0,0))
        view.backgroundColor=UIColor.lightGrayColor()
        return view
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let initIdentifier = "Cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: initIdentifier)
        cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text=cellTitles[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}