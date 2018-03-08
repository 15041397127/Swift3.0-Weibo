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
    
    //微博数据数组 原始假数据
//    private lazy var statusList = [String]()
    
    //列表视图模型
    private lazy var listViewModel = WBSatuesListViewModel()
    
    
    override func viewDidLoad(){
        
       super.viewDidLoad()
   
        
    }
    
    override func loadData() {
         super .loadData()
        
        //用网络工具 加载微博数据
       
//        WBNetWorkManager.shared.statusList { (list, isSuccess) in
//
//            print(list)
//        }
        print("准备刷新,最后一条\(self.listViewModel.statuesLsit.last?.text)")
        listViewModel.loadStatues(pullUp:self.isPullUp) { (isSuccess,shouldRefresh) in
            
            print("刷新表格")
            //结束刷新控件
            self.refreshControl?.endRefreshing()
            //回复上拉刷新标记
            self.isPullUp = false
            //刷新表格
            
            if shouldRefresh{
                self.tableView?.reloadData()
            }
        }
        
        
        print("开始")
        
        /*
        //模拟延时加载 -> dispatch_after
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {


            for i in 0..<15 {
                
                if self.isPullUp {
                    //将数据追加到底部
                    self.statusList.append("上拉 \(i)")
                    
                }else{
                    //将数据插入到数组的顶部
                    self.statusList.insert(i.description, at: 0)
                    
                }
     
            }
            print("刷新表格")
            
            //结束刷新控件
            self.refreshControl?.endRefreshing()
            //回复上拉刷新标记
            self.isPullUp = false
            //刷新表格
            self.tableView?.reloadData()

        }
  */
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
//     return statusList.count
//    print("*********\(listViewModel.statuesLsit.count)")
     return listViewModel.statuesLsit.count
    
    
  }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.取cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        //2.设置cell
        
//        cell.textLabel?.text = statusList[indexPath.row]
         cell.textLabel?.text = listViewModel.statuesLsit[indexPath.row].text
//        cell.textLabel?.text = "aaaaa"
        return cell
        
    }
    
}


//MARK:设置页面
extension WBHomeViewController {
    
    //重写父类方法
    override func setupTableView() {
 
        super.setupTableView()
        //设置导航栏按钮
        //无法高亮
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action:#selector(showFriends))
        
        //swift 调用oc 返回instance方法 判断不出是否可选
//        let btn:UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        
         navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", target: self, action:  #selector(showFriends))
        
        //注册原型cell
//        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView?.register(UINib.init(nibName: "WBStatusNormalCell", bundle: nil), forCellReuseIdentifier: cellId)
        setupNavTitle()
    }
    
    //设置导航栏标题
    private func setupNavTitle(){
        
        let title = WBNetWorkManager.shared.userAccount.screen_name
//        let button = UIButton.cz_textButton(WBNetWorkManager.shared.userAccount.screen_name, fontSize: 17, normalColor: UIColor.darkGray, highlightedColor: UIColor.black)
//
//        button?.setImage(UIImage(named:"navigation_down"), for: .normal)
//        button?.setImage(UIImage(named:"navigation_up"), for: .selected)
        
        //抽取button
        let button = WBTitleButton(title: title)
        
        navItem.titleView = button
        
        button.addTarget(self, action: #selector(clickTileButton), for: .touchUpInside)
        
    }
   
    @objc func clickTileButton(btn:UIButton){
        
        //设置选中状态
        
        btn.isSelected = !btn.isSelected
        
    }
}

