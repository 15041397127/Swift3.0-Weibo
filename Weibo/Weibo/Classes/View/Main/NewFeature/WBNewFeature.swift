//
//  WBNewFeature.swift
//  Weibo
//
//  Created by ZhangXu on 2018/2/27.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//新特性视图
class WBNewFeature: UIView {
    @IBOutlet weak var scorllView: UIScrollView!
    @IBOutlet weak var enterBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //进入微博
    @IBAction func enterAction() {
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.yellow
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
