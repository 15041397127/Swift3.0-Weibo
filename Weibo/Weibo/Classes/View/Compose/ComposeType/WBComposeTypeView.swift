//
//  WBComposeTypeView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/29.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//撰写微博类型视图
class WBComposeTypeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        backgroundColor = UIColor.cz_random()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      //显示当前视图
    func show(){
        
        //1 > 将当前视图添加到 根视图控制器
        guard  let vc = UIApplication.shared.keyWindow?.rootViewController else{
            
            return
        }
        //2.添加视图
        vc.view.addSubview(self)

    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
