//
//  WBSatuesListViewModel.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/24.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation
//微博数据列表视图模型
/*
 父类选择
 -如果类需要使用"KVC"或者字典转模型框架设置对象值,类就需要继承NSObject
 
 -如果类只包装一些代码逻辑,可以不用任何父类 好处更加轻量级
 
 - OC一律继承NSObject
 */

//负责微博的数据处理
//1.字典转模型
//2.下来/上拉刷新数据处理
class WBSatuesListViewModel {
    //微博模型数组懒加载
    lazy var statuesLsit = [WBSatues]()
    
    /// 加载微博列表
    ///
    /// - Parameter completion: 完成回调 
    func loadStatues(completion:@escaping(_ isSuccess:Bool) -> ()){
        
        WBNetWorkManager.shared.statusList { (list, isSuccess) in
            
            //1.字典转模型
            guard  let array = NSArray.yy_modelArray(with: WBSatues.self, json: list ?? []) as? [WBSatues] else{

                completion(isSuccess)
                return
            }
          
            
            
            //2.拼接数据
            self.statuesLsit += array
            //3.完成回调
            completion(isSuccess)
            
        }
    }
}
