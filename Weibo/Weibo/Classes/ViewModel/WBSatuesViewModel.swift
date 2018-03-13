//
//  WBSatuesViewModel.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation

//单条的微博视图模型
/*
   如果没有任何父类 如果希望在开发时调试 输出调试信息 需要
   1.CustomStringConvertible
   2.实现 description
 */

//关于表格的性能优化

//-尽量少计算 所有需要的素材提前计算好
//- 控件上不要设置圆角半径 所有图像渲染的属性 都要注意
// -不要动态创建控件  所有需要的控件 都要提前创建好 在显示的时候 根据数据隐藏 / 显示
//-cell中控件的层次越少越好 数量越少越好
//-要测量 不要猜测

class WBSatuesViewModel:CustomStringConvertible {
    
    //微博模型
    var status:WBSatues
    
    //存储型属性 用内存换CPU
    var memberIcon:UIImage?

    /// 构造函数
    ///
    /// - Parameter model: 微博模型
    /// - return:微博的视图模型
    init(model:WBSatues) {
        self.status = model
        
        ///会员等级 0-6  common_icon_membership_level1
        
        if (model.user?.mbrank)! > 0 && (model.user?.mbrank)! < 7{
            
            let imageName = "common_icon_membership_level\(model.user?.mbrank ?? 1)"
            
            memberIcon = UIImage(named: imageName)
        }
        
    }
    
    var description: String{
        
        return status.description
        
    }
    
}
