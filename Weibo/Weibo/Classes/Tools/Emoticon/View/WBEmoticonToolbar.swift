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
    //MARK:监听方法
    //点击分组项按钮
    @objc private func clickItem(button:UIButton){
        
        
    }

}

private extension WBEmoticonToolbar{
    
    func stupUI(){
        
        //从表情包的分组名称 设置按钮
        let manager = WBEmoticonManager.shared
        
        for (i,p) in manager.packages.enumerated() {
            let bt = UIButton()
            bt.setTitle(p.groupName, for: [])
            bt.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            bt.setTitleColor(UIColor.white, for: [])
            bt.setTitleColor(UIColor.darkGray, for: .highlighted)
            bt.setTitleColor(UIColor.darkGray, for: .selected)
            
            let imageName = "compose_emotion_table_\(p.bgImageName ?? "")_normal"
            
            let imageNameHL = "compose_emotion_table_\(p.bgImageName ?? "")_selected"
            
            var image = UIImage(named: imageName, in: manager.bundle, compatibleWith: nil)

            var  imageHL = UIImage(named: imageNameHL, in: manager.bundle, compatibleWith: nil)
            
            //拉伸图像
            let size = image?.size ?? CGSize()
            let inset = UIEdgeInsetsMake(size.height * 0.5, size.width * 0.5, size.height * 0.5, size.width * 0.5)
            image = image?.resizableImage(withCapInsets: inset)
            imageHL = imageHL?.resizableImage(withCapInsets: inset)
            
            bt.setBackgroundImage(image, for: [])
            bt.setBackgroundImage(imageHL, for: .highlighted)
            bt.setBackgroundImage(imageHL, for: .selected)
            bt.sizeToFit()
            addSubview(bt)
            
            //设置按钮的tag
            bt.tag = i
            
            //添加监听方法
            bt.addTarget(self, action: #selector(clickItem), for: .touchUpInside)
        }
        //默认选中第0个按钮
        (subviews[0] as! UIButton).isSelected = true

    }
}
