//
//  CZRefreshView.swift
//  Weibo
//
//  Created by 张旭 on 2018/3/26.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//刷新视图 负责刷新相关的UI显示和动画
class CZRefreshView: UIView {

    //刷新状态
    /*
     iOS系统中 uiview 封装的旋转动画
     - 默认顺时针旋转
     - 就近原则
     - 要想实现同方向旋转 需要调整一个非常小的数字(近)
     - 如果想实现 360旋转 需要核心动画 CABaseAnimation
    */
    var refreshState:ZXRefreshState = .Normal {
        
        didSet{
            
            switch refreshState {
            case .Normal:
                //恢复状态
                tipIcon?.isHidden = false
                indicator?.stopAnimating()
                
                
                tipLable?.text = "继续使劲拉..."
                UIView.animate(withDuration: 0.25){
                    self.tipIcon?.transform = CGAffineTransform.identity
                }
            case .Pulling:
                tipLable?.text = "放手继续刷新...."
                
                UIView.animate(withDuration: 0.25){
                    //尾随闭包
                    self.tipIcon?.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI - 0.001))
                }
            
            case .willRefresh:
                tipLable?.text = "正在刷新ing...."
                
                //隐藏提示图标
                tipIcon?.isHidden = true
                
                //显示菊花
                indicator?.startAnimating()
            }
        }
    }
    
    //父视图高度 -为了刷新控件不需要关系当前具体的刷新视图是谁
    var parentViewHeight:CGFloat = 0
    
    @IBOutlet weak var tipIcon: UIImageView?//提示图标
    @IBOutlet weak var tipLable: UILabel?//提示标签
    @IBOutlet weak var indicator: UIActivityIndicatorView?//指示器
    
    class func refreshView() -> CZRefreshView {
        
        let nib = UINib(nibName: "ZXMeiTuanRefreshView", bundle: nil)
        
        return nib.instantiate(withOwner: nib, options: nil)[0] as! CZRefreshView
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
