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
    /// - Parameters:
    ///   - since_id: 若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
    ///   - max_id:      若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
    ///   - completion: 完成回调 list :微博字典数组 是否成功
    func statusList(since_id:Int64 = 0,max_id:Int64 = 0, completion:@escaping(_ list:[[String:Any]]?,_ isSuccess:Bool) -> ()){
        
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        //Swift中int可以转换成AnyObject /但int64不想
        let params = ["since_id":"\(since_id)",
            "max_id":"\(max_id > 0 ? max_id-1 : 0)"]
//        let urlString = "https://api.weibo.com/2/statuses/user_timeline.json"
        
//        let params = ["access_token":"2.00zRg7yBI5bbwBda3940370fQ4ijnC"]
    
        tokenRequest(method: .GET, URLString: urlString, parameters: params) { (json, isSuccess) in
            
            //从json中获取 statuses字典数组
            //如果as?失败 result = nil
            let result =  (json as AnyObject)["statuses"] as? [[String:Any]]
          
            completion(result,isSuccess)
            
//            print(json)
        }
    }
    
    //返回微博的未读数量
    func unreadCount(completion:@escaping(_ count: Int)->()){
        guard let uid = uid else { return  }
        
        let urlString = "https://rm.api.weibo.com/2/remind/unread_count.json"
        
        let params = ["uid":uid]
        
        tokenRequest(URLString: urlString, parameters: params) { (json, isSuccess) in
            print(json)
            let dic = json as? [String:Any]
            let count = dic?["status"] as? Int
            completion(count ?? 0)
            
        }
        
    }
    
}

//MARK:OAuth 相关方法
extension WBNetWorkManager{
    
    //加载AccessToken
    func loadAccessToken(code:String){
        
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let params = ["client_id":WBAppKey,
                      "client_secret":WBAppSecret,
                      "grant_type":"authorization_code",
                      "code":code,
                      "redirect_uri":WBRedirectURI]
        
        //发起网络请求
        request(method: .POST, URLString: urlString, parameters: params) { (json, isSuccess) in
            
            print(json)
            
            
        }
        
    }

}


