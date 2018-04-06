//
//  WBWebViewController.swift
//  Weibo
//
//  Created by 张旭 on 2018/4/6.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//网页控制器
class WBWebViewController: WBBaseViewController {

  private lazy var webView = UIWebView(frame: UIScreen.main.bounds)
    
    //要加载的url字符串
    var urlString:String?{
        
        didSet{
            guard let urlString = urlString,
                  let url = URL(string: urlString)
            else {
                return
            }
            
            webView.loadRequest(URLRequest(url: url))
        }
        
    }

}
extension WBWebViewController{
    
    override func setupTableView() {
//        super.setupTableView()
        navItem.title = "网页"
        view.insertSubview(webView, belowSubview: navigationBar)
        webView.backgroundColor = UIColor.white
        
        //设置contetnInst
        webView.scrollView.contentInset.top = navigationBar.bounds.height
    }
    
}
