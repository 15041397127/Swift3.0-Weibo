//
//  WBOAuthViewController.swift
//  Weibo
//
//  Created by ZhangXu on 2018/2/5.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
// 通过webview加载新浪微博授权页面控制器
class WBOAuthViewController: UIViewController {

    private lazy var webView = UIWebView()
    
    override func loadView() {
        
        view = webView
        
        view.backgroundColor = UIColor.white
        
        if #available(iOS 11.0, *) {
            
           webView.scrollView.contentInsetAdjustmentBehavior = .never
            
        }else {
            
            automaticallyAdjustsScrollViewInsets = false;
            
        }
        
        //设置导航栏
        title = "登录新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontSize: 16, target: self, action: #selector(close), isBackButton: true)
        
        

        // Do any additional setup after loading the view.
    }

    
    @objc private func close()  {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
