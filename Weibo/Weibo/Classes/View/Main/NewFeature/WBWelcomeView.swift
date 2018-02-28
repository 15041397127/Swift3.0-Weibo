//
//  WBWelcomeView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/2/27.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import SDWebImage
//欢迎视图
class WBWelcomeView: UIView {

    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    class func welcomeView() -> WBWelcomeView {
        
        let nib = UINib(nibName: "WBWelcomeView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WBWelcomeView
        
        v.frame  = UIScreen.main.bounds
        //从XIB加载的视图 默认是600 *  600
        
        
        
        return v
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        //initWithCode 只是刚刚从XIB二进制文件数据加载完成
        //还没有和代码连线建立起关系  所以开发是 千万不要在这个方法里处理UI
        print("initWithCode  + \(iconView)")
        
    }
    
    override func awakeFromNib() {
        
        //1.url
        
       guard let urlString = WBNetWorkManager.shared.userAccount.avatar_large,
             let url = URL(string: urlString) else{
            return
        }
        
        //2.设置图像
        
        iconView.sd_setImage(with: url, placeholderImage: UIImage(named: "avatar_default"))
        
     
       
    }
    
    //视图被添加到window 表示视图已经显示
    override func didMoveToWindow() {
        
        super.didMoveToWindow()
        
        //视图是使用自动布局来设置的 只是设置了约束
        //当视图被添加到窗口事 根据父类视图的大小 计算约束值 更新控件位置
        
        self.layoutIfNeeded()
        
        bottomCons.constant = bounds.size.height-200
        
        //如果控件们的frame还没计算好 所有的约束会一起动画
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            
            self.layoutIfNeeded()
            
        }) { (_) in
            
            UIView.animate(withDuration: 1.0, animations: {
                self.tipLabel.alpha = 1
            }, completion: { (_) in
                
            })
        }
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
