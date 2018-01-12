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
    lazy var navigationBar = UINavigationBar(frame:CGRect(x: 0,y:0,width:UIScreen.cz_screenWidth(),height: 64))
    
   //自定义的导航条目
    lazy var navItem = UINavigationItem()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
//    - (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    UIEdgeInsets safeAreaInsets = sgm_safeAreaInset(self.view);
//    CGFloat height = 44.0; // 导航栏原本的高度，通常是44.0
//    height += safeAreaInsets.top > 0 ? safeAreaInsets.top : 20.0; // 20.0是statusbar的高度，这里假设statusbar不消失
//    if (_navigationbar && _navigationbar.height != height) {
//    _navigationbar.height = height;
//    }
    
    override func viewDidLayoutSubviews() {
        
   
        
        
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
//      self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior
//
        if #available(iOS 11.0, *) {
//            self.additionalSafeAreaInsets.top = (-20,0,0,0)
//            additionalSafeAreaInsets.top = 20
            
//            additionalSafeAreaInsets.bottom =
//             navigationBar.prefersLargeTitles = true
//          view.contentInsetAdjustmentBehavior =  UIScrollViewContentInsetAdjustmentBehavior
          navigationBar.frame = CGRect(x: 0,y:0,width:UIScreen.cz_screenWidth(),height: 64+20)
            
            
        }
        
  
     automaticallyAdjustsScrollViewInsets = false
     extendedLayoutIncludesOpaqueBars = true;
      
        //添加导航条
        view.addSubview(navigationBar)
        
        navigationBar.backgroundColor = UIColor.cyan
        //将item设置给bar
        navigationBar.items = [navItem]
    }

}
