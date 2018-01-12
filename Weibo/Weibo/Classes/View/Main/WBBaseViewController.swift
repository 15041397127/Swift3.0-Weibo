//
//  WBBaseViewController.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame:CGRect(x:0,y:0,width:UIScreen.cz_screenWidth(),height:64))
    
   //自定义的导航条目
    lazy var navItem = UINavigationItem()
        
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    override var title: String?{
        //didSet重写set方法
        didSet{
            
            navItem.title = title
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:设置界面
extension WBBaseViewController{
    
    @objc  func setupUI(){
        
        view.backgroundColor = UIColor.cz_random()
        
        //添加导航条
        view.addSubview(navigationBar)
        //将item设置给bar
        navigationBar.items = [navItem]
    }

}
