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
class WBSatuesViewModel:CustomStringConvertible {
    
    //微博模型
    var status:WBSatues
    
    
    /// 构造函数
    ///
    /// - Parameter model: 微博模型
    /// - return:微博的视图模型
    init(model:WBSatues) {
        self.status = model
        
    }
    
    var description: String{
        
        return status.description
        
    }
    
}
