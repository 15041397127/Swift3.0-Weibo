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
        
        super.loadView()
//        view = webView
        let h:CGFloat? = (navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
        webView.frame = (CGRect.init(x: 0, y:h ?? 0, width: UIScreen.cz_screenWidth(), height:  UIScreen.cz_screenHeight()))
        
        view.backgroundColor = UIColor.white
        
        if #available(iOS 11.0, *) {
            
           webView.scrollView.contentInsetAdjustmentBehavior = .never
            
        }else {
            
            automaticallyAdjustsScrollViewInsets = false;
            
        }
        
        //设置导航栏
        title = "登录新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontSize: 16, target: self, action: #selector(close), isBackButton: true)
        
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", target: self, action: #selector(autoFill))
        
         view.addSubview(webView)
        // Do any additional setup after loading the view.
    }

    override func viewDidLoad() {
        
        //加载授权页面
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WBAppKey)&redirect_uri=\(WBRedirectURI)"
        
        //确定要访问的资源
    
        guard let url = URL(string: urlString)else {
            return
        }
        
        //建立请求
        let request = URLRequest(url:url)
        
        //加载请求
        
        webView.loadRequest(request)
        
        
    }
    
    
    
    
    @objc private func close()  {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    //webview的注入 直接通过js修改 修改"本地浏览器中" 缓存的页面内容
    //点击登录按钮 执行submit() 将本地数据提交给服务器
    @objc private func autoFill()  {
        
        //准备js 让webview执行
        
        let js = "document.getElementById('userId').value = '15042353719';" + "document.getElementById('passwd').value = '******';"
        
        webView.stringByEvaluatingJavaScript(from: js)
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
