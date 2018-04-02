//
//  WBComposeTypeButton.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/29.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//UIControl内置了 touchUpinside事件响应
class WBComposeTypeButton: UIControl {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //点击按钮要展现控制器的类型
    var clsName:String?
    
    /// 使用xib加载
    ///
    /// - Parameters:
    ///   - imageName: <#imageName description#>
    ///   - title: <#title description#>
    /// - Returns: <#return value description#>
    class func composeTypeButton(imageName:String,title:String) -> WBComposeTypeButton{
        
        let nib = UINib(nibName: "WBComposeTypeButton", bundle: nil)
        
        let bt = nib.instantiate(withOwner: nil, options: nil)[0] as! WBComposeTypeButton
        
        bt.imageView.image = UIImage(named: imageName)
        bt.titleLabel.text = title
        
        return bt
    }
    
}
