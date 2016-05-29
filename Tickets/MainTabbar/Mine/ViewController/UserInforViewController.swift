//
//  UserInforViewController.swift
//  Tickets
//
//  Created by ai966669 on 16/5/15.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class UserInforViewController: UIViewController {
    var tableView:UITableView!
    var cellTitles=[[],["积分"],["手机","身份证","职业"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.ColorByRGB(241, G: 241, B: 241, A: 1)
        initTableView()
        // Do any additional setup after loading the view.
    }
    func initTableView(){
        tableView=UITableView.init(frame: CGRectMake(0, 20, ScreenW, ScreenH))
        tableView.delegate=self
        tableView.dataSource=self
        tableView.backgroundColor=UIColor.ColorByRGB(241, G: 241, B: 241, A: 1)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.tableFooterView=UIView.init(frame: CGRectMake(0, 0, 0, 0))
        view.addSubview(tableView)
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
extension UserInforViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }else if section == 1{
            return 1
        }else{
            return 3
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        return (section != cellTitles.count) ? 30 : 0
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        Log("\(indexPath.section) \(indexPath.row)")
        return (indexPath.section == 0 && indexPath.row == 0) ? 100 : 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let initIdentifier = "CellHeader"
            let cell = AvatarTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: initIdentifier)
            cell.imageView?.layer.masksToBounds=true
            let getsture=UITapGestureRecognizer .init(target: self, action: #selector(UserInforViewController.changeAvatorImg))
            getsture.numberOfTapsRequired=1
            getsture.numberOfTouchesRequired=1
            cell.imageView!.addGestureRecognizer(getsture)
            cell.imageView?.layer.cornerRadius=5
            return cell
        }else{
            let initIdentifier = "Cell"
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: initIdentifier)
            cell.textLabel?.text=cellTitles[indexPath.section][indexPath.row]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
////        let cell = self.tableView
////        let cell = self.tableView(tableView, cellForRowAtIndexPath: NSIndexPath.init(forRow: 0, inSection: 1))
//       let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 1))
//        cell!.textLabel?.text="asdfasf"
////        tableView.beginUpdates()
////        tableView.endUpdates()
////        let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
////        cell.textLabel?.text="asdf"
    }
    func changeAvatorImg(){
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
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
        let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 1))
        cell!.imageView?.image=image
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        picker.dismissViewControllerAnimated(true, completion: nil)
        SVProgressHUD.showInfoWithStatus("取消")
    }
}
