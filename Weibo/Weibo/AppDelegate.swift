//
//  AppDelegate.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
 
      setupAdditions()
        
      window = UIWindow()
      window?.backgroundColor = UIColor.white
      window?.rootViewController = WBMainViewController()
      window?.makeKeyAndVisible()
     
      loadAppInfo()
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    



}
//MARK:
extension AppDelegate{
  
    private func setupAdditions(){

        //1.设置 SVProgressHUD 最小解除时间
        
        SVProgressHUD.setMinimumDismissTimeInterval(1)
        
        //2.设置网络加载指示器
        AFNetworkActivityIndicatorManager.shared().isEnabled = true
        
        
        //取得用户授权显示通知(上方通知提示  声音  badgeNumber) swift4  UNUserNotificationCenter不管用
        let notifySettings = UIUserNotificationSettings(types: [.alert,.badge,.sound], categories: nil)
        //Application 为
        UIApplication.shared.registerUserNotificationSettings(notifySettings)
    }
}

//MARK: - 从服务器加载应用程序信息
extension AppDelegate {
    
    private func loadAppInfo(){
       
        //1.模拟异步
        DispatchQueue.global().async {
            
        //1.url
         
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)

       //2.data
        let data = NSData(contentsOf:url!)
         
       //3.写入磁盘
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        
        data?.write(toFile: jsonPath, atomically: true)
            
        print("应用程序加载完毕\(jsonPath)")
            
        }
 
    }

}

