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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.yellowColor()
        initTableView()
        // Do any additional setup after loading the view.
    }
    func initTableView(){
        tableView=UITableView.init(frame: CGRectMake(0, 0, ScreenW, ScreenH))
        tableView.delegate=self
        tableView.dataSource=self
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (section == 0) ? 1 : 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        Log("\(indexPath.section) \(indexPath.row)")
        return (indexPath.section == 0 && indexPath.row == 0) ? 40 : 40
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let initIdentifier = "CellHeader"
            let cell = AvatarTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: initIdentifier)
            cell.imageView?.layer.masksToBounds=true
            var getsture=UITapGestureRecognizer .init(target: self, action: #selector(UserInforViewController.changeAvatorImg))
        getsture.numberOfTapsRequired=1
        getsture.numberOfTouchesRequired=1
        cell.imageView!.addGestureRecognizer(getsture)
        cell.imageView!.userInteractionEnabled=true
            cell.imageView?.image=UIImage.init(named: "candel.jpg")
            cell.imageView?.layer.cornerRadius=5
            return cell
        }else{
            let initIdentifier = "Cell"
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: initIdentifier)
            cell.textLabel?.text="\(indexPath.row)"
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
        let cell = tableView(tableView, cellForRowAtIndexPath: NSIndexPath.init(forRow: 0, inSection: 0))
        picker.dismissViewControllerAnimated(true, completion: nil)
//nwwdohere为什么照片不能显示        
        cell.imageView?.image=image
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        SVProgressHUD.showInfoWithStatus("取消")
    }
}
