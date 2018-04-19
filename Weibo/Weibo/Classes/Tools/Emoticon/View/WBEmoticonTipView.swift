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

    init() {
        let bundle = WBEmoticonManager.shared.bundle
        let image = UIImage(named: "emoticon_keyboard_magnifier", in: bundle, compatibleWith: nil)
        //[uiimageview alloc]initwithImage:image] 会根据图像大小设置图像视图的大小
        super.init(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
