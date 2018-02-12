//
//  WBNetWorkManager.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/23.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import AFNetworking

//Swift的枚举支持任意数据类型
//switch / enum 在oc中都只有支持整数
enum WBHTTPMethod {
    case GET
    case POST
}

//网络管理工具
class WBNetWorkManager: AFHTTPSessionManager {

    //创建单例
    //静态区/ 常量 / 闭包
    //在第一次访问时 执行闭包 并且将结果保存在shared 常量中
//    static let shared = WBNetWorkManager()
    
    static let shared:WBNetWorkManager = {
        //实例化对象
        let instance = WBNetWorkManager()
        
        //设置响应的反序列化支持的数据类型
    
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")        //返回对象
        return instance
        }()
    
    lazy var userAccount = WBUserAccount()
    
    /*
    //访问令牌 所有网络请求,都基于此令牌(登陆除外)
    //访问令牌有时限,默认3天
    //token过期 返回403
    var accessToken:String?// = "2.00zRg7yBtpiWGBe514f633acby_t4E"
    
    //用户的微博id
    var uid:String? = "1809072083"
    */
    //用户登录标记[计算型属性]
    var userLogon:Bool{
        
//        return accessToken != nil
        return userAccount.access_token != nil
    }
    
    
    //专门负责拼接token 的网路请求方法
    func tokenRequest(method:WBHTTPMethod = .GET,URLString:String,parameters:[String:Any]?,completion:@escaping (_ json:Any?,_ isSuccess:Bool) ->()){
        
        //处理token字典
        //0>判断token是否为nil  为nil直接返回
        guard let token = userAccount.access_token else {
        
            print("没有token!需要登录")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: nil)
            completion(nil,false)
            return
        }
        
        //1> 判断 参数字典是否存在 如果为nil 应该新建一个字典
        var parameters = parameters
        
        if parameters == nil {
            parameters = [String:Any]()
        }
        
        //2>设置参数字典,代码在此处字典一定有值 可以强行解包
        parameters!["access_token"] = token
        
        
        //调用request发起真正的网络请求方法
        request(URLString: URLString, parameters: parameters!, completion: completion)
        
        
    }
    //使用一个函数封装AFNde get 和post
  
    /// 封装AF get/post请求
    ///
    /// - Parameters:
    ///   - method: GET \ POST
    ///   - URLString: URLString
    ///   - parameters: 参数字典
    ///   - completion: 完成回调
    func request(method:WBHTTPMethod = .GET,URLString:String,parameters:[String:Any],completion:@escaping (_ json:Any?,_ isSuccess:Bool) ->()){
        
        //成功回调
        let succsess = {(task:URLSessionDataTask,json:Any?) -> () in
            
            completion(json,true)
     
        }
        
        //失败回调
        let failure = {(task:URLSessionDataTask?,error:Error) -> () in
            
            //针对返回403 token过期
            //测试用户每天的刷新量有限
            //超出上限 就被token锁定 就要换token
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                
                print("Token过期")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: "bad token")
    
            }
            
            
            //error 通常比较吓人 例如编号 XXXX 错误原因一堆英文
            print("网络请求错误\(error)")
            completion(nil,false)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: succsess, failure: failure)
            
        }else{
            
            post(URLString, parameters: parameters, progress: nil, success: succsess, failure: failure)
        }

    }
    
}
