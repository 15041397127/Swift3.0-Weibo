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
    @IBOutlet weak var textView: WBComposeTextView!
    //底部工具栏
    @IBOutlet weak var toolBar: UIToolbar!
    //发布按钮
    @IBOutlet var sendButton: UIButton!
    //标题标签  换行的热键option +  回车
    //逐行选中文本并且设置属性
    //如果要想调整行间距 可以增加一个空行  设置空行的字体  lineHeight
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet weak var toolBarBottonmCons: NSLayoutConstraint!//工具栏底部约束
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
        
        //监听键盘通知 - UIWindow.h
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardChanged), name:NSNotification.Name.UIKeyboardWillChangeFrame,
                                               object: nil)
        
 
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        //激活键盘
        textView.becomeFirstResponder()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        
        textView.resignFirstResponder()
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //键盘监听方法
    @objc private func keyboardChanged(n:NSNotification){
        
        //拿到目标 rect
        guard let rect = (n.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
             let duration = (n.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
            else {
                return;
        }
        
     //   UIKeyboardAnimationDurationUserInfoKey 动画时长
   
     
        //设置底部约束高度
        let offset = view.bounds.height - rect.origin.y
        
        //更新底部约束
        
        toolBarBottonmCons.constant = offset
        
        //动画更新约束
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func close(){
        
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK:按钮监听方法
    //发布微博
    @IBAction func postStatus(_ sender: Any) {
        
        //获取微博文字
        guard let text  = textView.text else {
            return
        }
        
        WBNetWorkManager.shared.postStatus(text: text) { (result, isSuccess) in
            
            print(result)
            
        }
        
        
    }
    
//    //懒加载 bt
//    lazy var sendButton:UIButton = {
//
//        let btn = UIButton()
//        btn.setTitle("发布", for: [])
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        btn.setTitleColor(UIColor.white, for: [])
//        btn.setTitleColor(UIColor.gray, for: .disabled)
//
//        //设置背景图片
//        btn.setBackgroundImage(UIImage(named: "common_button_orange"), for: [])
//        btn.setBackgroundImage(UIImage(named: "common_button_orange_highlighted"), for: .highlighted)
//        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .disabled)
//        btn.frame = CGRect(x: 0, y: 0, width: 45, height: 35)
//        return btn
//    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//MARK: -UITextViewDelegate
/*
    代理方法 一对一 发生事件是 直接让代理执行方法  可以反向传值
    通知 一对多  注册监听之后 注销之前都可以接受到消息  将通知发送给通知中心 在广播出去
    若果层次嵌套很深 可以使用通知
 */
extension WBComposeViewController:UITextViewDelegate{
    
    //文本视图文字的变化
    func textViewDidChange(_ textView: UITextView) {
       
        sendButton.isEnabled = textView.hasText
        
    }

}


private extension WBComposeViewController{
    
    func setupUI(){
        
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupToolBar()
    }
    
    //设置导航栏
    func setupNavigationBar(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: sendButton)
        
        //设置标题视图
        navigationItem.titleView = titleLabel
        sendButton.isEnabled = false

    }
    //设置工具栏
    func setupToolBar(){
//        "actionName":"emotionKeyboard"],
        let itemSettings = [["imageName":"compose_toolbar_picture"],
                            ["imageName":"compose_mentionbutton_background"],
                            ["imageName":"compose_trendbutton_background"],
                            ["imageName":"compose_emoticonbutton_background"],
                            ["imageName":"compose_add_background"]]
        //遍历数组
        var items = [UIBarButtonItem]()
        
        for s  in itemSettings {
            
            guard let imageName = s["imageName"] else {
                continue
            }
            
            let image = UIImage(named: imageName)
            let imageHL = UIImage(named: imageName + "_highlighted")
            let bt = UIButton()

            bt.setImage(image, for: [])
            bt.setImage(imageHL, for: .highlighted)
            bt.sizeToFit()
            items.append(UIBarButtonItem(customView: bt))
            
            //追加弹簧  是按钮平均分配
            items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        }

            //删除末尾弹簧
            items.removeLast()
            toolBar.items = items
        
    }

}

