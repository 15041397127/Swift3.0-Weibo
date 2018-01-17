//
//  WBBaseViewController.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//面试题:OC中支持多继承吗(不支持), 如何替代:使用协议
//swift的写法更类似于多继承
//class WBBaseViewController:UITableViewDelegate,UITableViewDataSource


// Swift中，利用 extension 可以把“函数”按照功能分类管理，便于阅读和维护
//注意：
//1.extension 中不能有属性
//2.extension 中不能重写“父类”本类的方法；重写父类的方法是子类的职责，扩展是对类的扩展

class WBBaseViewController: UIViewController {

    //设置登陆状态
    var userLogon  = true
    
    //访客视图信息字典
    var visitorInfoDict: [String:String]?
    
    //可选的tableview
    var tableView:UITableView?
    
    //刷新控件
    var refreshControl:UIRefreshControl?
    
    //自定义导航条
 
    lazy var navigationBar = WBNavBar(frame:CGRect(x: 0,y:  0,width:UIScreen.cz_screenWidth(),height: 64))
//

   //自定义的导航条目
    lazy var navItem = UINavigationItem()
    
    //上拉刷新标记
    var isPullUp = false
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    override var title: String?{
        //didSet重写set方法
        didSet{

            navItem.title = title
            

        }
    }
    
    //加载数据 -具体的实现由子类负责
    @objc func loadData(){
        
        //如果子类不实现任何方法,默认关闭刷新控件
        refreshControl?.endRefreshing()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:设置界面
extension WBBaseViewController{
    
    @objc  func setupUI(){

    
        view.backgroundColor = UIColor.white
        
    
        setupNavBar()
        userLogon ? setupTableView() : visitorView()
        //取消自动缩进 - 如果隐藏了导航栏，会缩进 20 个点
        if #available(iOS 11.0, *) {
            
            tableView?.contentInsetAdjustmentBehavior = .never
            
        }else {
            
            automaticallyAdjustsScrollViewInsets = false;
            
        }
    
    }
    
    //表格
    private func setupTableView() {
        
        tableView = UITableView(frame:view.bounds,style:.plain)
        
//        view.addSubview(tableView!)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        let navBarHeight:CGFloat?
        if UIScreen.main.bounds.height == 812 {
            
            navBarHeight = 96
            
        }else{
            navBarHeight = navigationBar.bounds.height
            
        }
        //设置缩进内容
        tableView?.contentInset  = UIEdgeInsetsMake(navBarHeight ?? 64 , 0,tabBarController?.tabBar.bounds.height ?? 49 , 0)
        
        //设置刷新控件
        //1.实例化控件
        refreshControl = UIRefreshControl()
        
        //2.添加到表格视图
        tableView?.addSubview(refreshControl!)
        
        //3.添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        
    }
    
    private func visitorView(){
        
        let visitorView = WBVisitorView(frame:view.bounds)
        
        view.insertSubview(visitorView, belowSubview: navigationBar)
        
        //设置访客视图信息
        visitorView.visitorInfo = visitorInfoDict
        
    }
    
    private func setupNavBar() {

        //        navigationBar.frame = CGRect(x: 0,y:  0,width:UIScreen.cz_screenWidth(),height: 64)
        
        //添加导航条
        view.addSubview(navigationBar)
        
        
        //        navigationBar.backgroundColor = UIColor.cyan
        //将item设置给bar
        navigationBar.items = [navItem]
        
        
        
        //设置navBar的渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        
        //设置nav字体颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.darkGray]
        //        navigationBar.tintColor = UIColor.red
        
        
        
    }
    
}

//MARK:tableview 数据源 代理方法
extension WBBaseViewController :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    //基类只是准备方法 子类负责具体的实现
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    //显示最后一行的时候,做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //1.判断 indexPath 是否是最后一行
        //(indexPath.section(最大)/indexPath.row(最后一行))
        //1.row
        let row = indexPath.row
        //2.section
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0{
            return
        }
        
        //3.行数
        let count = tableView.numberOfRows(inSection: section)
        
        //如果是最后一行 ,同时没有开始上拉刷新
        if row == (count - 1) && !isPullUp {
            print("上啦刷新")
            isPullUp = true
            //开始刷新
            loadData()
        }
        
    }
    
}



//自己的方式适配ios11 自定义导航栏
//    override func viewDidLayoutSubviews() {
//
//       super.viewDidLayoutSubviews()
//
//
//         if #available(iOS 11.0, *) {
//            navigationBar.isTranslucent = false
//            if UIScreen.main.bounds.height == 812 {
//
//                navigationBar.frame = CGRect(x: 0, y: 44, width: UIScreen.cz_screenWidth(), height: 62)
//
//                let view1 = UIView()
//                view1.frame = CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 44)
//                view1.backgroundColor = UIColor.cz_color(withHex: 0xF6F6F6)
//                view .addSubview(view1)
//
//            }else{
//                navigationBar.frame = CGRect(x: 0, y: 20, width: UIScreen.cz_screenWidth(), height: 44)
//
//                let view1 = UIView()
//                view1.frame = CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 20)
//                view1.backgroundColor = UIColor.cz_color(withHex: 0xF6F6F6)
//
//                view .addSubview(view1)
//
//            }
//
//         }else{
//
//        }
//    }



