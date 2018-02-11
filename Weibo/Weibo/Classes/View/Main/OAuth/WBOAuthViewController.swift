//
//  WBOAuthViewController.swift
//  Weibo
//
//  Created by ZhangXu on 2018/2/5.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import SVProgressHUD
// 通过webview加载新浪微博授权页面控制器
class WBOAuthViewController: UIViewController {

    private lazy var webView = UIWebView()
    
    override func loadView() {
        
        super.loadView()
//        view = webView
        webView.delegate = self
        let h:CGFloat? = (navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
        webView.frame = (CGRect.init(x: 0, y:h ?? 0, width: UIScreen.cz_screenWidth(), height:  UIScreen.cz_screenHeight()))
        webView.scrollView.isScrollEnabled = false //取消滚动
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
        
        SVProgressHUD.dismiss()
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

extension WBOAuthViewController:UIWebViewDelegate{
    
    
    /// webview 将要加载请求
    ///
    /// - Parameters:
    ///   - webView: webview
    ///   - request: 要加载的请求
    ///   - navigationType: 导航类型
    /// - Returns: 是否加载request
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        //若请求地址包含WBRedirectURI 不加载页面 /否则加载页面
        //request.url?.absoluteString.hasSuffix(WBRedirectURI)返回的是可选项 bool /nil
        if request.url?.absoluteString.hasPrefix(WBRedirectURI) == false {
            
            return true
            
        }
        

//        print("加载请求----\(request.url?.absoluteString)")
        
        //query 就是url中 ? 后面的所有部分
//        print("加载请求----\(request.url?.query)")
        //从WBRedirectURI 回调地址的查询字符串中查找 "code= "
        if request.url?.query?.hasPrefix("code=") == false {
            
            print("取消授权")
            close()
            return false
        }
        
        //从query字符串中取出授权码
        //代码走到此处,url中一定有查询字符串,并且包含code
//          let code = request.url?.query?.substring(from: "code=".endIndex)//swift4已废弃substring
       let code = request.url?.query?.suffix(from:"code=".endIndex) ?? ""
        
       print("授权码:\(code)")
        
       print("获取授权码")
        //如果有,授权成功,否则,授权失败
        
        
        //使用授权码获取AccessToken
        WBNetWorkManager.shared.loadAccessToken(code: String(code)) { (isSuccess) in
            
            if !isSuccess {
                
                SVProgressHUD.showInfo(withStatus: "网络请求失败")
                
            }else{
                
                SVProgressHUD.showInfo(withStatus: "登录成功")
                //通过通知发送登录成功消息
                NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: WBUserLoginSuccessNotification),
                    object: nil)
                
                
                //关闭窗口
                self.close()
                
            }
            
            
        }
        
        return false
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
   
}
