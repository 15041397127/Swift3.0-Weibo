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
    ///提示:参数之所以参照网络接口,就是为了保证对原有代码最小化调整
    ///
    /// - Parameters:
    ///   - since_id: 下拉刷新id
    ///   - max_id: 上拉刷新id
    ///   - completion: 完成回调(微博的字典数组,是否成功)
    class func loadStatus(since_id:Int64 = 0,max_id:Int64 = 0,completion:@escaping(_ list:[[String:Any]]?,_ isSuccess:Bool) -> ()){
        
        //0.获取用户代号
        guard let userId = WBNetWorkManager.shared.userAccount.uid else {
            return
        }
        
        //1.检查本地数据 如果有直接返回
       let array = WBSQLiteManager.shared.loadStatus(userId:userId , since_id: since_id, max_id: max_id)
        //判断数组的数量 没有数据返回的事没有数据的空数组
        if array.count > 0 {
            completion(array,true)
            return
        }
        
        //2.加载网络数据
        WBNetWorkManager.shared.statusList(since_id: since_id, max_id: max_id) { (list, isSuccess) in
            
            //判断网络请求是否成功
            if !isSuccess{
                completion(nil,false)
                return
            }
            
           //判断数据
            guard let list = list else{
                completion(nil,isSuccess)
                return
            }
             //3.加载完成之后 将网络数据[字典数组],写入数据库 同步写入
            WBSQLiteManager.shared.updateSatues(userId: userId, array:list as [[String : AnyObject]])
            
            
            //4.返回网络数据
            completion(list,isSuccess)
            
        }

    }

}
