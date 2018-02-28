//
//  WBTitleButton.swift
//  Weibo
//
//  Created by ZhangXu on 2018/2/27.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBTitleButton: UIButton {

    //重载构造函数
    //title如果是nil 就显示首页
    init(title:String?) {
        
        super.init(frame: CGRect())
        
        //1.判断tile是否为nil
        
        if title == nil {
            setTitle("首页", for: .normal)
        }else{
            
            setTitle(title! + " ", for: .normal)
            setImage(UIImage(named:"navigation_down"), for: .normal)
            setImage(UIImage(named:"navigation_up"), for: .selected)
        }
        
        //2.设置字体和颜色
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        setTitleColor(UIColor.darkGray, for: .normal)
        
        sizeToFit()

    }
    
    required init?(coder aDecoder: NSCoder) {
    
      fatalError("init(coder:) has not been implemented")
    }
    
    //重新布局子视图
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        //判断label 和 imageView
        guard let titleLabel = titleLabel, let imageView = imageView else { return  }
        
        titleLabel.frame.origin.x = 0;
        imageView.frame.origin.x = titleLabel.bounds.width;
        //将label的x 向左移动 imageview宽度

//        titleLabel.frame = titleLabel.frame.offsetBy(dx: -imageView.bounds.width, dy: 0)

       //imageview 的 x 向右移动lable宽度

//        imageView.frame = imageView.frame.offsetBy(dx: titleLabel.bounds.width, dy: 0)
        
//        print(titleLabel.frame)
//        print(imageView.frame)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
