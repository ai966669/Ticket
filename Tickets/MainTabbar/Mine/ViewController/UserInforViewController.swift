//
//  UserInforViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/5/15.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class UserInforViewController: LoginNeedViewController {
    var tableView:UITableView!
    var btnLoginOut:UIButton!
    var cellTitles=[["头像","昵称"],["积分"],["手机","身份证","职业"]]
    var cellDetailTexts:NSMutableArray=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.DefaultBackgroundColor()
        checkLogin {
            self.initTableView()
        }
        
        // Do any additional setup after loading the view.
    }
    func initTableView(){
        cellDetailTexts=[
            ["","\(UserModel.shareManager.userName)"],
            ["\(UserModel.shareManager.score)"],
            [
                UserModel.shareManager.phone,
                (UserModel.shareManager.idCardNo != "") ? UserModel.shareManager.idCardNo:"未绑定",
                (UserModel.shareManager.job != "") ? UserModel.shareManager.job:"未设置"
            ]
        ]
        tableView=UITableView.init(frame: CGRectMake(0, 10, ScreenW, ScreenH))
        tableView.delegate=self
        tableView.dataSource=self
        tableView.backgroundColor=UIColor.ColorByRGB(241, G: 241, B: 241, A: 1)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        view.addSubview(tableView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
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
extension UserInforViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return cellTitles.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellTitles[section].count
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return (section+1 != cellTitles.count) ? 20 : 70
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        Log("\(indexPath.section) \(indexPath.row)")
        return (indexPath.section == 0 && indexPath.row == 0) ? 100 : 50
    }

    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewForFooterInSection=UIView.init(frame: CGRectMake(0, 0, 0, 0))
        if section == cellTitles.count-1{
            viewForFooterInSection.backgroundColor=UIColor.clearColor()
            btnLoginOut=UIButton.init(frame: CGRectMake(0, 20, ScreenW, 50))
            btnLoginOut.backgroundColor=UIColor.redColor()
            btnLoginOut.setTitle("登出", forState: UIControlState.Normal)
            btnLoginOut.addTarget(self, action: #selector(UserInforViewController.loginout), forControlEvents: UIControlEvents.TouchUpInside)
            viewForFooterInSection.addSubview(btnLoginOut)
        }else{
            viewForFooterInSection.backgroundColor=UIColor.DefaultBackgroundColor()
        }
        return viewForFooterInSection
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0{
            let initIdentifier = "CellHeader"
            let cell = AvatarTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: initIdentifier)
            let getsture=UITapGestureRecognizer .init(target: self, action: #selector(UserInforViewController.changeAvatorImg))
            getsture.numberOfTapsRequired=1
            getsture.numberOfTouchesRequired=1
            cell.imgAvator.addGestureRecognizer(getsture)
            cell.textLabel?.text=cellTitles[indexPath.section][indexPath.row]
            return cell
        }else{
            let initIdentifier = "Cell"
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: initIdentifier)
            cell.textLabel?.text=cellTitles[indexPath.section][indexPath.row]
            if let str = (cellDetailTexts[indexPath.section] as! NSArray)[indexPath.row] as? String{
                cell.detailTextLabel?.text = str
            }
            cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        let cell = self.tableView
        //        let cell = self.tableView(tableView, cellForRowAtIndexPath: NSIndexPath.init(forRow: 0, inSection: 1))
        let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 1))
        cell!.textLabel?.text="asdfasf"
        //        tableView.beginUpdates()
        //        tableView.endUpdates()
        //        let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
//    func changeAvatorImg(){
//dohere加上可以从相册获取
//        UIActionSheet *aUIActionSheet=UIActionSheet()
//    }
    func changeAvatorImg(){
//        navigationController?.popViewControllerAnimated(true)
        if (HelpFromOc.isCameraAvalible()){
            //创建图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //设置来源
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            //允许编辑
            picker.allowsEditing = true
            //打开相机
            self.presentViewController(picker, animated: true, completion: { () -> Void in
            })
        }else{
            print("找不到相机")
        }
    }
}
extension UserInforViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        picker.dismissViewControllerAnimated(true) {
            
            let imgData=UIImageJPEGRepresentation(image, 0)
            if (imgData !=
                nil){
                MUpToFile.upToFile(imgData!, backInfo: { (info,key,resp) -> Void in
                    Log("info:\(info),key:\(key),resp:\(resp)")
                    
                    if (resp != nil){
                        if let strKey =  resp["key"] as? String {
                            
                            if let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0)) as? AvatarTableViewCell{
                                cell.imgAvator.image=image
                                UserModel.shareManager.avatarUrl=strKey
                            }
                            
                        }
                    }
                    
                    }, fail: {
                        
                })
            }
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        picker.dismissViewControllerAnimated(true, completion: nil)
        SVProgressHUD.showInfoWithStatus("取消")
    }
    func loginout(){
        UserModel.shareManager.loginOut()
    }
    
}
