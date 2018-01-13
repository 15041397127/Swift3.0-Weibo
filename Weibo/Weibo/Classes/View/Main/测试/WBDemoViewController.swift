//
//  WBDemoViewController.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/11.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置标题
        title = "第\(navigationController?.childViewControllers.count ?? 0)个"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -监听方法
    //继续PUSH一个新的控制器
    @objc private func  showNext(){
    
        let vc = WBDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    
    
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

extension WBDemoViewController {
    
    override func setupUI() {
        
        super.setupUI()
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个",style: .plain, target:self ,action:#selector(showNext))
        
//        let btn:UIButton = UIButton.cz_textButton("下一个", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(showNext), for: .touchUpInside)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", target: self, action:  #selector(showNext))

    }
}



