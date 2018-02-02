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

    //定时器
    private var timer:Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildController()
        setupComposeButton()
        setupTimer()

        delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        //销毁时钟
        timer?.invalidate()
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
        // let width = tabBar.bounds.width / count - 1  已经用tabbarcontroller delegate修复
        let width = tabBar.bounds.width / count
        //CGRectInset 正数向内缩进,负数向外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * width, dy: 0)
        tabBar.addSubview(composeButton)
        print("\(composeButton.bounds.width)")
        
        //按钮监听方法
        
        composeButton.addTarget(self, action: #selector(composeStatues), for: .touchUpInside)
        
    }
    
    
    
    
    //设置所有子控制器
    private func setupChildController(){
        
        /*
        let array: [[String:AnyObject]] = [
            (["clsName":"WBHomeViewController","title":"首页","imageName":"home","visitorInfo":["imageName":"","message":"关注一些人，回到这里看看有什么惊喜"]] as AnyObject) as! Dictionary<String, AnyObject>,
            (["clsName":"WBMessageViewController","title":"消息","imageName":"message_center","visitorInfo":["imageName":"visitordiscover_image_message","message":"登录后，别人评论你的微博,发给你的消息,这里可以收到通知"]] as AnyObject) as! Dictionary<String, AnyObject>,
            (["clsName":"UIViewController"] as AnyObject) as! Dictionary<String, AnyObject>,//增加中间加号
            (["clsName":"WBDiscoverViewController","title":"发现","imageName":"discover","visitorInfo":["imageName":"visitordiscover_image_message","message":"登录后，最新、最热微博尽在账务,不再会与事实擦肩而过"]] as AnyObject) as! Dictionary<String, AnyObject>,
            (["clsName":"WBProfileViewController","title":"我","imageName":"profile","visitorInfo":["imageName":"visitordiscover_image_profile","message":"登录后，你的微博、你的相册、个人资料会显示在这里,展示给别人"]] as AnyObject) as! Dictionary<String, AnyObject>,
            ]
        
        //测试数据格式是否正确 转成plist数据更加直观
       // (array as NSArray).write(toFile: "/Users/zhangxu/Desktop/demo.plist", atomically: true)
        
        //数组 -> json序列化
        let data = try!JSONSerialization.data(withJSONObject: array, options: [.prettyPrinted])
        
        (data as NSData).write(toFile: "/Users/zhangxu/Desktop/main.json", atomically: true)
 
   */
        
        //获取沙河json路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        
        //加载data
        var data = NSData(contentsOfFile: jsonPath)
        
        //判断data是否有内容,如果没有,说明本地沙盒没有文件
        if data == nil {
            
            //从bundle加载data
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            
            data = NSData(contentsOfFile: path!)
            
        }
        //data 一定会有一个内容 反序列化
        //1.路径 2.加载NSData 3.反序列化转换成数组
        
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String:AnyObject]]
        
            else {
                return
            
        }
        
        
        //遍历数组 循环创建控制器数组
        var arrayM = [UIViewController]()
        for dict in array! {
            
            arrayM.append(controller(dict: dict))
        }
        
        //设置 tabBar的子控制器
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

//MARK:--时钟相关方法
extension WBMainViewController{
    
    //定义时钟
    private func  setupTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector:#selector(updateTimer), userInfo: nil, repeats: true)
 
    }
    
    //时钟触发方法
    @objc private func updateTimer(){
       
        
        //测试未读数量
        WBNetWorkManager.shared.unreadCount { (count) in
            //设置首页 tabBarItem的 badgeNumber
            
             print("监测到\(count)")
            
            self.tabBar.items?[0].badgeValue = count > 0 ? "\(count)" : nil
            
            //设置app bageNumber 要做授权
            UIApplication.shared.applicationIconBadgeNumber = count
        }
        
    }
}

//MARK:UITabBarControllerDelegate
extension WBMainViewController:UITabBarControllerDelegate{
    

    /// 将要选择 tabbarItem
    ///
    /// - Parameters:
    ///   - tabBarController: tabBarController
    ///   - viewController: 目标控制器
    /// - Returns: 是否切换到目标控制器
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        print("将要切换到 \(viewController)")
        //1 获取控制器在数组中的索引
        let index = (childViewControllers as NSArray).index(of: viewController)
        
        //2.判断当前索引是首页 同时index 也是首页 重复点击首页按钮
        if selectedIndex == 0 && index == selectedIndex {
            
            print("点击首页")
            
            //3 让表格滚动到顶部
            // a)获取到控制器
            let nav = childViewControllers[0] as! UINavigationController
            let vc = nav.childViewControllers[0] as! WBHomeViewController
            
            // b)滚动到顶部
            let barHeight:CGFloat?
            
            if UIScreen.main.bounds.height == 812 {
                barHeight = 96
               
            }else{
                barHeight = 64
            }
            
            vc.tableView?.setContentOffset(CGPoint(x:0,y:-barHeight!), animated: true)
            
            //4刷新数据 增加延迟是保证表格先滚动到顶部再刷新
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                  vc.loadData()
            })
            
         
        }
 
        //判断目标控制器是否是UIViewcontroller
        //修复tab按钮穿帮问题
        return !viewController.isMember(of: UIViewController.self)
        
   
    
    }
}



