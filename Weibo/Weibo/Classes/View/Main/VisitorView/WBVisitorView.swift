//
//  WBVisitorView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/15.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//访客视图
class WBVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK:设置页面
extension WBVisitorView {
    
    func setupUI(){
        
        self.backgroundColor = UIColor.white
        
        
    }

}
