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

    //返回微博的未读数量 -定时刷新不需要提示失败
    func unreadCount(completion:@escaping(_ count: Int)->()){
        guard let uid = userAccount.uid else { return  }
        
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
//MARK:发布微博
extension WBNetWorkManager{
    func postStatus(text:String,completion:@escaping (_ result:[String:AnyObject]?,_ isSuccess:Bool) ->()) -> () {
        
//        urlStr = "https://upload.api.weibo.com/2/statuses/upload.json"
//
//    urlStr = "https://api.weibo.com/2/statuses/update.json"
//        https://api.weibo.com/2/statuses/share.json
        let urlString = "https://api.weibo.com/2/statuses/update.json"
        
        let params = ["status":text]
        
        tokenRequest(method: .POST, URLString: urlString, parameters: params) { (json, isSuccess) in
            
            completion(json as? [String:AnyObject],isSuccess)
        }
        
    }
}
//MARK:-用户信息
extension WBNetWorkManager{
    
    //加载用户信息 用户登录之后执行
    func loadUserInfo(completion:@escaping (_ dict:[String:AnyObject]) -> ()){
        
        guard let uid = userAccount.uid else {
           return
        }
        
        let usrlString = "https://api.weibo.com/2/users/show.json"
        
        let params = ["uid":uid]
        
        tokenRequest(URLString: usrlString, parameters: params) { (json, isSuccess) in
            
            print(json)
            
            completion((json as? [String:AnyObject]) ?? [:] )
            
        }
        
    }
    
}

//MARK:OAuth 相关方法
extension WBNetWorkManager{

    //网络请求异步
    
    /// 加载AccessToken
    ///
    /// - Parameters:
    ///   - code: 授权码
    ///   - completion: 完成回调(是否成功)
    func loadAccessToken(code:String,completion:@escaping (_ isSuccess:Bool) ->()){
        
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let params = ["client_id":WBAppKey,
                      "client_secret":WBAppSecret,
                      "grant_type":"authorization_code",
                      "code":code,
                      "redirect_uri":WBRedirectURI]
        
        //发起网络请求
        request(method: .POST, URLString: urlString, parameters: params) { (json, isSuccess) in
            
            print(json)
            
            //如果请求失败 对用户账户数据不会有任何影响
            //直接用字典设置usrAccount 的属性
            self.userAccount.yy_modelSet(with: (json as? [String:AnyObject]) ?? [:])
             print(self.userAccount)
            
            //加载当前用户信息
            self.loadUserInfo(completion: { (dict) in
                
                //使用用户信息字典设置用户账户信息(昵称 头像)
                
                self.userAccount.yy_modelSet(with: dict)
                
                self.userAccount.saveAccount()
                //用户信息加载完成  完成回调
                completion(isSuccess)
            })
        
            
        }
        
    }

}


