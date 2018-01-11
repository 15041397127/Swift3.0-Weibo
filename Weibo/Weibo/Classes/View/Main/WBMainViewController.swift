//
//  WBMainViewController.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit


/// 主控制器
class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildController()
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//extension 类似于oc中的 分类在swift中可以切分代码块
//可以把相近的功能的函数,放在一个extension中
//便于代码维护
//注意:和OC分类一样 不能定义属性
//MARK:-设置页面
extension WBMainViewController{
    
    //设置所有子控制器
    private func setupChildController(){
        
        let array = [
            ["clsName":"WBHomeViewController","title":"首页","imageName":""],
            ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    
    /// 使用一个字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典[clsName ,title ,imageName]
    /// - Returns: 子控制器
    private func controller(dict:[String: String]) -> UIViewController{
        
        //1.取得字典内容
      guard  let clsName = dict["clsName"],
             let title = dict["title"],
             let imageName = dict["imageName"],
             let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type
             else {
            
            return UIViewController()
            
        }
      //2.创建视图控制器
      //将clsName 转换成 cls
      let vc = cls.init()
        
       vc.title = title
       let nav = WBNavigationController(rootViewController:vc)
        
        return nav//多态
    }

}


