//
//  WBEmoticonToolbar.swift
//  表情键盘
//
//  Created by ZhangXu on 2018/4/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

/// 表情键盘底部工具栏
class WBEmoticonToolbar: UIView {

    override func awakeFromNib() {
        
        stupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //布局所有按钮
        let count = subviews.count
        let w = bounds.width / CGFloat(count)
        let rect = CGRect(x: 0, y: 0, width: w, height: bounds.height)
        for (i,bt)  in subviews.enumerated() {
            
            bt.frame = rect.offsetBy(dx: CGFloat(i) * w, dy: 0)
        }
    }

}

private extension WBEmoticonToolbar{
    
    func stupUI(){
        
        //从表情包的分组名称 设置按钮
        let manager = WBEmoticonManager.shared
        
        for p in manager.packages {
            let bt = UIButton()
            bt.setTitle(p.groupName, for: [])
            bt.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            bt.setTitleColor(UIColor.white, for: [])
            bt.setTitleColor(UIColor.darkGray, for: .highlighted)
            bt.setTitleColor(UIColor.darkGray, for: .selected)
            bt.backgroundColor = UIColor.cyan
            bt.sizeToFit()
            addSubview(bt)
            
        }

    }
}
