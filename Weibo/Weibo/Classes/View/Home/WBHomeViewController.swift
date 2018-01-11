//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {
    
    override func viewDidLoad(){
        
       super.viewDidLoad()
        
        
    }
    @objc private func showFriends(){
        
        print(#function)
        let demoVC = WBDemoViewController()
        
        demoVC.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(demoVC, animated: true)
        
        
    }

}

//MARK:设置页面
extension WBHomeViewController {
    
    //重写父类方法
    
    override func setupUI() {

        //设置导航栏按钮

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action:#selector(showFriends))
    }
   
}

