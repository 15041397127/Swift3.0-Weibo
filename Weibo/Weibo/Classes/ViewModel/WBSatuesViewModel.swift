//
//  WBSatuesViewModel.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation

//单条的微博视图模型
class WBSatuesViewModel {
    
    //微博模型
    var status:WBSatues
    
    
    /// 构造函数
    ///
    /// - Parameter model: 微博模型
    /// - return:微博的视图模型
    init(model:WBSatues) {
        self.status = model
        
    }
    
}
