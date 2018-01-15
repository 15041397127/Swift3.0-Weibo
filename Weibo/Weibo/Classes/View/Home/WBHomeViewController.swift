//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//定义全局常量,最好private修饰 否在其他也可以访问
private let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {
    
    //微博数据数组
    private lazy var statusList = [String]()
    
    
    override func viewDidLoad(){
        
       super.viewDidLoad()
   
        
    }
    
    override func loadData() {
         super .loadData()
        
        for i in 0..<15 {
            
            //将数据插入到数组的顶部
            statusList.insert(i.description, at: 0)
        }
        
        
    }
    
    @objc private func showFriends(){
        
        print(#function)
        
        let demoVC = WBDemoViewController()
        
//        demoVC.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(demoVC, animated: true)

    }

}

//MARK:- 表格数据源方法
extension WBHomeViewController{
    
  override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  
  {
     return statusList.count
        
  }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.取cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        //2.设置cell
        
        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
        
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
        
        
         navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", target: self, action:  #selector(showFriends))
        
        //注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
   
}

