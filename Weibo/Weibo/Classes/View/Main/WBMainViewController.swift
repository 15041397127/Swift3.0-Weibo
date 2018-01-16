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
    
    //播放视频 通常是用  modal展现的(present)
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        
        return .portrait
        
    }
    
    //MARK: - 监听方法
    //撰写微博
    //FIXME:没有实现
    //private 能够保证方法私有,仅在当前对象被访问
    //@objc  允许函数在运行时通过OC 的消息机制被调用!
    @objc private func composeStatues()  {
        
        print("撰写微博")
        
        let vc = UIViewController ()
        vc.view.backgroundColor = UIColor.cz_random()
        let nav = UINavigationController(rootViewController:vc)
        
        present(nav, animated: true, completion: nil)
        
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
        
        //按钮监听方法
        
        composeButton.addTarget(self, action: #selector(composeStatues), for: .touchUpInside)
        
    }
    
    
    
    //设置所有子控制器
    private func setupChildController(){
        
        let array: [[String:AnyObject]] = [
            (["clsName":"WBHomeViewController","title":"首页","imageName":"home","visitorInfo":["imageName":"","message":"关注一些人，回到这里看看有什么惊喜"]] as AnyObject) as! Dictionary<String, AnyObject>,
            (["clsName":"WBMessageViewController","title":"消息","imageName":"message_center","visitorInfo":["imageName":"visitordiscover_image_message","message":"登录后，别人评论你的微博,发给你的消息,这里可以收到通知"]] as AnyObject) as! Dictionary<String, AnyObject>,
            (["clsName":"UIViewController"] as AnyObject) as! Dictionary<String, AnyObject>,//增加中间加号
            (["clsName":"WBDiscoverViewController","title":"发现","imageName":"discover","visitorInfo":["imageName":"visitordiscover_image_message","message":"登录后，最新、最热微博尽在账务,不再会与事实擦肩而过"]] as AnyObject) as! Dictionary<String, AnyObject>,
            (["clsName":"WBProfileViewController","title":"我","imageName":"profile","visitorInfo":["imageName":"visitordiscover_image_profile","message":"登录后，你的微博、你的相册、个人资料会显示在这里,展示给别人"]] as AnyObject) as! Dictionary<String, AnyObject>,
            ]
        
        //测试数据格式是否正确 转成plist数据更加直观
       // (array as NSArray).write(toFile: "/Users/zhangxu/Desktop/demo.plist", atomically: true)
        
        var arrayM = [UIViewController]()
        for dict in array {
            
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    
    /// 使用一个字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典[clsName ,title ,imageName,visitorView]
    /// - Returns: 子控制器
    private func controller(dict:[String: AnyObject]) -> UIViewController{
        
        //1.取得字典内容
        guard  let clsName = dict["clsName"] as? String ,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? WBBaseViewController.Type,
            let visitorDic = dict["visitorInfo"] as? [String:String]
            else {
                
                return UIViewController()
                
        }
        //2.创建视图控制器
        //将clsName 转换成 cls
        let vc = cls.init()
        
        vc.title = title
        
        //设置控制器的访客视图信息字典
        vc.visitorInfoDict = visitorDic
        
        //3设置图像
        
        vc.tabBarItem.image = UIImage(named:"tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named:"tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        //4.设置tabBar标题字体(大小)
    vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.orange], for: .highlighted)
   
   //系统默认大小12
   vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize:12)], for: .normal)
        
        //实例化导航控制器的时候,会调用 push方法将 rootVC压栈
        let nav = WBNavigationController(rootViewController:vc)
        
        return nav//多态
    }

}


