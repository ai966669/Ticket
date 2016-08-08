//
//  MainTabbar.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class MainTabbar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("self.navigationController=%@",self.navigationController)
        tabBar.tintColor = UIColor.TopicColor()
        title="首页"
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
//    private  func createTitleView(titleStr:String){
//        let lbl=UILabel.init(frame: CGRectMake(0, 0, ScreenW, 44))
//        lbl.textAlignment=NSTextAlignment.Center
//        lbl.text=titleStr
//        navigationItem.titleView=lbl
//    }
}
extension MainTabbar{
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        //界面切换效果不是很好
        switch item.tag {
        case 1:
            title="首页"
            navigationController?.setNavigationBarHidden(false, animated: false)
        case 2:
            navigationController?.setNavigationBarHidden(true, animated: false)
        case 3:
            title="我的"
             navigationController?.setNavigationBarHidden(true, animated: false)
//            navigationController?.navigationBar.hidden = true
        default:
            navigationController?.setNavigationBarHidden(false, animated: false)
        }
    }
}