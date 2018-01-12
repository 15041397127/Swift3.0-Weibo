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
    convenience  init(title:String,fontSize:CGFloat = 16,target:AnyObject?,action:Selector) {
        
        let btn:UIButton = UIButton.cz_textButton(title, fontSize:fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(target, action: action, for: .touchUpInside)
   
        //self.init 实例化 UIBarButtonItem
        
        self.init(customView:btn)
    }
}
