//
//  AppDelegate.swift
//  Tickets
//
//  Created by ai966669 on 16/4/29.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navMain:UINavigationController?
    var navLogin:UINavigationController?
    func loginOutUnexpected(msgShow:String){
        UserModel.shareManager.loginOut()
        //登出操作
        if (navMain != nil){
            navMain?.popToRootViewControllerAnimated(false)
        }
        self.setRootViewControllerIsLogin()
        if msgShow != ""{
            
        }
    }

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.makeKeyAndVisible()

        setRootViewControllerisTabbar()
        
        UserModel.loginByToken({
                print("token失效")
            }, failInLogin: {
                print("登陆失败")
            }, success: {
                print("登陆成功")
        })
        
        // Override point for customization after application launch.
        return true
    }
    func setRootViewControllerIsLogin(){
        
        if (navLogin == nil){

            let aLoginViewController:LoginViewController?=UIStoryboard(name: "LoginAndRegist", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as?  LoginViewController
            
            navLogin = UINavigationController(rootViewController: aLoginViewController!)
            
            navMain?.navigationBar.tintColor=UIColor.whiteColor()
            
            navMain?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName:UIColor.whiteColor()]
            
        }
        if ((navMain) != nil){
            if   let aMainTabbar = navMain?.viewControllers[0] as? MainTabbar{
                aMainTabbar.navigationController?.popViewControllerAnimated(false)
                    aMainTabbar.selectedIndex=0;
            }
        }
        self.window?.rootViewController=navLogin
    }
    func  setRootViewControllerisTabbar() {
        
        if (navMain == nil){
            
            let aStroyBoardSource = UIStoryboard(name: "MainTabBar", bundle: nil)
            
            navMain = UINavigationController(rootViewController: aStroyBoardSource.instantiateInitialViewController()!)
            
            navMain?.navigationBar.tintColor=UIColor.whiteColor()
            
            navMain?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName:UIColor.whiteColor()]

        }
        
        self.window?.rootViewController=navMain
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

