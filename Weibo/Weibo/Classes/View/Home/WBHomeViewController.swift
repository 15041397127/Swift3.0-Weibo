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
        
//        demoVC.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(demoVC, animated: true)

    }

}

//MARK:设置页面
extension WBHomeViewController {
    
    //重写父类方法
       override func setupUI() {
        super.setupUI()
        //设置导航栏按钮
        //无法高亮
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action:#selector(showFriends))
        
        //swift 调用oc 返回instance方法 判断不出是否可选
//        let btn:UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        
         navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", target: self, action:  #selector(showFriends))
    }
   
}

