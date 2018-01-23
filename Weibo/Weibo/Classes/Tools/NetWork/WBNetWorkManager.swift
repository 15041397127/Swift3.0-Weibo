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
    static let shared = WBNetWorkManager()
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
            //error 通常比较吓人 例如编号 XXXX 错误原因一堆英文
            print("网络请求错误\(error)")
            completion(nil,false)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: succsess, failure: failure)
            
//            get(URLString, parameters: parameters, progress: nil , success: succsess, failure: failure)
        }else{
            
            post(URLString, parameters: parameters, progress: nil, success: succsess, failure: failure)
        }

    }
    
}
