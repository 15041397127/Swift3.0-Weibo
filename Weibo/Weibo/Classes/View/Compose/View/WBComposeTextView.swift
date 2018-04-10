//
//  WBComposeTextView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/4/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//撰写微博的文本视图

class WBComposeTextView: UITextView {

    private lazy var placeholderLabel =  UILabel()
    
    override func awakeFromNib() {
         setupUI()
    }

}

private extension WBComposeTextView{
    
    func setupUI(){
        
        //设置站位标签
        placeholderLabel.text = "分享新鲜事"
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.frame.origin = CGPoint(x: 5, y: 8)
        placeholderLabel.sizeToFit()
        addSubview(placeholderLabel)
        
        
    }

}