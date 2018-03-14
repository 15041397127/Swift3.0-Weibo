//
//  WBStatusPictureView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/14.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBStatusPictureView: UIView {

    @IBOutlet weak var heightCons: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
        setupUI()
        
    }
    
    
}

//MARK: - 设置页面
extension WBStatusPictureView{
    //cell中所有的空间都是提前准备好
    //设置的时候根据数据是否显示
    //不要动态创建控件
    private func setupUI(){
     
        //超出边界的内容不显示
        clipsToBounds = true
        
        //循环创建 9个imgeView
        let count = 3
        let rect = CGRect(x: 0, y: WBStatusPictureViewOutterMargin, width: WBStatusPictureItemWidth, height: WBStatusPictureItemWidth)
        
        for i in 0..<count * count {
            
            let iv = UIImageView()
            iv.backgroundColor = UIColor.red
            //行
            let row = CGFloat (i/count)
            //列
            let col = CGFloat (i%count)
            
            let xOffset = col * (WBStatusPictureItemWidth + WBStatusPictureViewInnerMargin)
            let yOffset = row * (WBStatusPictureItemWidth + WBStatusPictureViewInnerMargin)
            
            iv.frame = rect.offsetBy(dx:xOffset , dy: yOffset)
            addSubview(iv)
        
        }
    }
}
