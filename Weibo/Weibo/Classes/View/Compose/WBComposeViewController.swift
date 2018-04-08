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

        view.backgroundColor = UIColor.cz_random()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "退出", target: self, action: #selector(close))
        // Do any additional setup after loading the view.
    }
    
    @objc private func close(){
        
        dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
