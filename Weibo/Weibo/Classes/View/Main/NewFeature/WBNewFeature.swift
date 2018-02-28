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

    
    class func newFeature() -> WBNewFeature {
        
        let nib = UINib(nibName: "WBNewFeature", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WBNewFeature
        
        v.frame  = UIScreen.main.bounds
        //从XIB加载的视图 默认是600 *  600
        
    
        return v
        
    }
    
    override func awakeFromNib() {
        
        let conut  = 4
        let rect = UIScreen.main.bounds
        for i in 0..<conut {
            
            let imageName = "new_feature_\(i + 1)"
            let iv = UIImageView(image: UIImage.init(named: imageName))
            
            //设置大小
            
            iv.frame = rect.offsetBy(dx: CGFloat (i) * rect.width, dy: 0)
            
            scorllView.addSubview(iv)
        }
        
        //指定scrollview 的属性
        scorllView.contentSize = CGSize(width: CGFloat(conut + 1) * rect.width, height: rect.height)
        scorllView.bounces = false
        scorllView.isPagingEnabled = true
        scorllView.showsVerticalScrollIndicator = false
        scorllView.showsHorizontalScrollIndicator = false
        
        //隐藏按钮
        enterBtn.isHidden  = true
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
