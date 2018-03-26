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
    var refreshState:ZXRefreshState = .Normal {
        
        didSet{
            
            switch refreshState {
            case .Normal:
                tipLable.text = "继续使劲拉..."
            case .Pulling:
                tipLable.text = "放手继续刷新...."
            case .willRefresh:
                tipLable.text = "正在刷新ing...."
            }
        }
    }
    
    @IBOutlet weak var tipIcon: UIImageView!//提示图标
    @IBOutlet weak var tipLable: UILabel!//提示标签
    @IBOutlet weak var indicator: UIActivityIndicatorView!//指示器
    
    class func refreshView() -> CZRefreshView {
        
        let nib = UINib(nibName: "CZRefreshView", bundle: nil)
        
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
