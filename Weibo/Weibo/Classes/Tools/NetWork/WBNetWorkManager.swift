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
//如果日常开发中 发现网络请求返回的状态码是405 是不支持的网络请求方法
//首先检查网络请求是否正确
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

    ///
    /// - Parameters:
    ///   - method: GET/POST
    ///   - URLString: URLString
    ///   - parameters: 参数字典
    ///   - name: 上传文件使用的字段名 默认的nil 就不是上传文件
    ///   - data: 上传文件的二进制数据  默认为nil 不上上传
    ///   - completion: 完成回调
    func tokenRequest(method:WBHTTPMethod = .GET,URLString:String,parameters:[String:Any]?,name:String?=nil,data:Data? = nil,completion:@escaping (_ json:Any?,_ isSuccess:Bool) ->()){
        
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
        
        
        //3判断name 和data
        if let name = name,let data = data {
            
            upload(URLString: URLString, parameters: parameters!, name: name, data: data, completion: completion)
            
        }else{
            //调用request发起真正的网络请求方法
            //        request(URLString: URLString, parameters: parameters!, completion: completion)
            request(method: method, URLString: URLString, parameters: parameters!, completion: completion)
        }
 
    }
    
    //MARK:封装AF的上传文件方法 post请求
    ///
    /// - Parameters:
    ///   - URLString: URLString
    ///   - parameters: 参数字典
    ///   - name: 接收上传数据的服务器字段 pic
    ///   - data: 要上传的二进制数据
    ///   - completion: 完成回调
    func upload(URLString:String,parameters:[String:Any],name:String,data:Data,completion:@escaping (_ json:Any?,_ isSuccess:Bool) ->()){
        
        post(URLString, parameters: parameters, constructingBodyWith: { (formData) in
            
            /*
             1.data:要上传的二进制的数据
             2.name:服务器接收数据的字段名
             3.fileName:保存在服务器的文件名 大多数服务器 现在可以乱写
               很多服务器 上传图片完成后 会生产缩略图 中图  大图...
             4.mimeType告诉服务器上传文件的类型 如果不想告诉 可以使用application/octet-stream
             */
            formData.appendPart(withFileData: data, name: name, fileName: "xxx", mimeType: "application/octex-stream")
            
        }, progress: nil, success: { (_, json) in
            
            completion(json,true)
            
        }) { (task, error) in
            
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                
                print("Token过期")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: "bad token")
                
            }
            print("网络请求错误\(error)")
            completion(nil,false)
            
        }
        
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
