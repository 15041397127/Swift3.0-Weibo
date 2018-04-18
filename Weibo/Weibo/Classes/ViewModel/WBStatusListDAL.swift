//
//  WBStatusListDAL.swift
//  Weibo
//
//  Created by ZhangXu on 2018/4/18.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation
//DAL - Data Access Layer 数据访问层
//使命 负责处理数据库和网络层 给ListViewModel 返回微博的字典数组
//在调整系统的时候 尽量做最小化的调整
class WBStatusListDAL {
    
    
    /// 从本地数据库或者网络加载数据
    ///
    /// - Parameters:
    ///   - since_id: 下拉刷新id
    ///   - max_id: 上拉刷新id
    ///   - completion: 完成回调(微博的字典数组,是否成功)
    class func loadStatus(since_id:Int64 = 0,max_id:Int64 = 0,completion:@escaping(_ list:[[String:Any]]?,_ isSuccess:Bool) -> ()){
        
        //1.检查本地数据 如果有直接返回
        
        //2.加载网络数据
        
        //3.加载完成之后 将网络数据[字典数组],写入数据库
        
        //4.返回网络数据
        
        
    }

}
