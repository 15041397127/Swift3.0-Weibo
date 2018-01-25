//
//  WBNetWorkManager+extension.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/23.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation
//MARK:封装新浪微博的网络请求方法

extension WBNetWorkManager{
    
    /// 加载微博数据字典数组
    ///
    /// - Parameter completion: 完成回调 list :微博字典数组 是否成功
    func statusList(completion:@escaping(_ list:[[String:Any]]?,_ isSuccess:Bool) -> ()){
        
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
//        let urlString = "https://api.weibo.com/2/statuses/user_timeline.json"
        
//        let params = ["access_token":"2.00zRg7yBI5bbwBda3940370fQ4ijnC"]
    
        tokenRequest(method: .GET, URLString: urlString, parameters: nil) { (json, isSuccess) in
            
            //从json中获取 statuses字典数组
            //如果as?失败 result = nil
            let result =  (json as AnyObject)["statuses"] as? [[String:Any]]
          
            completion(result,isSuccess)
            
//            print(json)
        }
    }
}
