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
 
    lazy var navigationBar = UINavigationBar(frame:CGRect(x: 0,y:  0,width:UIScreen.cz_screenWidth(),height: 64))
//

   //自定义的导航条目
    lazy var navItem = UINavigationItem()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }



    override func viewDidLayoutSubviews() {
        
       super.viewDidLayoutSubviews()
 
      
         if #available(iOS 11.0, *) {
            navigationBar.isTranslucent = false
            if UIScreen.main.bounds.height == 812 {
                
                navigationBar.frame = CGRect(x: 0, y: 44, width: UIScreen.cz_screenWidth(), height: 62)
             
                let view1 = UIView()
                view1.frame = CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 44)
                view1.backgroundColor = UIColor.cz_color(withHex: 0xF6F6F6)
                view .addSubview(view1)
                
            }else{
                navigationBar.frame = CGRect(x: 0, y: 20, width: UIScreen.cz_screenWidth(), height: 44)

                let view1 = UIView()
                view1.frame = CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 20)
                view1.backgroundColor = UIColor.cz_color(withHex: 0xF6F6F6)
              
                view .addSubview(view1)
                
            }
            
         }else{

        }
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
        
        //取消自动缩进 - 如果隐藏了导航栏，会缩进 20 个点
//        if (@available(iOS 11.0, *)) {
//
//            contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//
//        }else {
//
//           automaticallyAdjustsScrollViewInsets = false;
//
//        }

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


//extension UINavigationBar{
//
//
//    override open func layoutSubviews() {
//            super.layoutSubviews()
////          self.frame = CGRect(x: 0, y: 0, width:UIScreen.cz_screenWidth(), height: 64)
//  self.frame  = CGRect(x: 0,y:  0,width:UIScreen.cz_screenWidth(),height: 64)
//            for aView in self.subviews {
//                if NSStringFromClass(type(of: aView)) == "_UINavigationBarContentView" {
//                    aView.frame = CGRect(x: 0, y: 20, width: aView.frame.width, height: aView.frame.height)
//                }
//                else if NSStringFromClass(type(of: aView)) == "_UIBarBackground" {
//                    aView.frame = CGRect(x: 0, y: 0, width: aView.frame.width, height: self.frame.height)
//                }
//            }
//        
//
//        }
//}




