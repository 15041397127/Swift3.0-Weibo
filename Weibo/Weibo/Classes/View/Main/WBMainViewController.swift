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
        setupComposeButton()
        
        // Do any additional setup after loading the view.
    }

    //MARK - 私有控件
    //加号按钮
    private lazy var composeButton:UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
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
    
    //设置加号按钮
    private func setupComposeButton(){
        
     
        //计算按钮的宽度
        let count = CGFloat(childViewControllers.count)
        //容错点:tabBar两个按钮之间会有一个点的位置会漏出去 因此-1  将向内的宽度减少,能够让按钮的宽度变大,盖住容错点,防止穿帮
        let width = tabBar.bounds.width / count - 1

        //CGRectInset 正数向内缩进,负数向外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * width, dy: 0)
        tabBar.addSubview(composeButton)
        print("\(composeButton.bounds.width)")
        
        
    }
    
    
    
    //设置所有子控制器
    private func setupChildController(){
        
        let array = [
            ["clsName":"WBHomeViewController","title":"首页","imageName":"home"],
             ["clsName":"WBMessageViewController","title":"消息","imageName":"message_center"],
             ["clsName":"UIViewController"],//增加中间加号
              ["clsName":"WBDiscoverViewController","title":"发现","imageName":"discover"],
               ["clsName":"WBProfileViewController","title":"我","imageName":"profile"],
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
        
        //3设置图像
        
        vc.tabBarItem.image = UIImage(named:"tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named:"tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        //4.设置tabBar标题字体(大小)
    vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.orange], for: .highlighted)
   
   //系统默认大小12
   vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize:12)], for: .normal)
        
        let nav = WBNavigationController(rootViewController:vc)
        
        return nav//多态
    }

}


