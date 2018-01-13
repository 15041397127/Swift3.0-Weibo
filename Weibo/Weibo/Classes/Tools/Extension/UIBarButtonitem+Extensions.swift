//
//  UIBarButtonitem+Extensions.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit


extension UIBarButtonItem{
    
    /// 创建UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize 默认16
    ///   - target: target
    ///   - action: action
    ///   - isBackButton: 是不是返回按钮 是的话加箭头
    convenience  init(title:String,fontSize:CGFloat = 16,target:AnyObject?,action:Selector,isBackButton:Bool = false) {
        
        let btn:UIButton = UIButton.cz_textButton(title, fontSize:fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        if isBackButton {
            
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage(named: imageName), for: .normal)
            btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
   
        //self.init 实例化 UIBarButtonItem
        
        self.init(customView:btn)
    }
}
