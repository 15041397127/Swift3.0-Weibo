//
//  WBEmoticonTipView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/4/19.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//表情选中提示视图
class WBEmoticonTipView: UIImageView {

    //MARK:私有控件
    private lazy var tipButton = UIButton()
    
    //MARK:构造函数
    init() {
        let bundle = WBEmoticonManager.shared.bundle
        let image = UIImage(named: "emoticon_keyboard_magnifier", in: bundle, compatibleWith: nil)
        //[uiimageview alloc]initwithImage:image] 会根据图像大小设置图像视图的大小
        super.init(image: image)
        
        //设置锚点
        layer.anchorPoint = CGPoint(x: 0.5, y: 1.2)
        
        //添加按钮
        tipButton.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        tipButton.frame = CGRect(x: 0, y: 8, width: 36, height: 36)
        tipButton.center.x = bounds.width * 0.5
        tipButton.setTitle("😆", for: [])
        tipButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        addSubview(tipButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
