//
//  WBComposeViewController.swift
//  Weibo
//
//  Created by ZhangXu on 2018/4/2.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//微博撰写控制器
/*
 加载视图控制器的时候 如果XIB和控制器同名 默认的构造函数 会优先加载XIB
  */
class WBComposeViewController: UIViewController {
    //文本编辑视图
    @IBOutlet weak var textView: UITextView!
    //底部工具栏
    @IBOutlet weak var toolBar: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
        
 
        // Do any additional setup after loading the view.
    }
    
    @objc private func close(){
        
        dismiss(animated: true, completion: nil)
        
    }
    
    //懒加载 bt
    lazy var sendButton:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("发布", for: [])
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(UIColor.white, for: [])
        btn.setTitleColor(UIColor.gray, for: .disabled)
        
        //设置背景图片
        btn.setBackgroundImage(UIImage(named: "common_button_orange"), for: [])
        btn.setBackgroundImage(UIImage(named: "common_button_orange_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .disabled)
        btn.frame = CGRect(x: 0, y: 0, width: 45, height: 35)
        return btn
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

private extension WBComposeViewController{
    
    func setupUI(){
        
        view.backgroundColor = UIColor.white
        setupNavigationBar()
    }
    
    //设置导航栏
    func setupNavigationBar(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: sendButton)
        sendButton.isEnabled = false
        
    }

}

