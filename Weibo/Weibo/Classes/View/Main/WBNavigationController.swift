//
//  WBNavigationController.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
    
    //重写push方法,所有push动作都会调用此方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        print(viewController)
        
        //隐藏底部的TabBar
        //不隐藏根控制器
        
        if childViewControllers.count > 0{
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        
        super .pushViewController(viewController, animated: true)
        
    }
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
