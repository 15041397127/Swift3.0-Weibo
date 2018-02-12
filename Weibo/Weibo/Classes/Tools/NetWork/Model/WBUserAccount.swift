//
//  WBUserAccount.swift
//  Weibo
//
//  Created by 张旭 on 2018/2/9.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
private let accountFile:NSString = "useraccount.json"
class WBUserAccount: NSObject {
    
    //访问令牌
    @objc var access_token:String? 
    //用户代号
    @objc var uid:String?

    //access_token的生命周期，单位是秒
    //开发者5年
    //测试使用者3天
    @objc var expires_in:TimeInterval = 0 {
        
        didSet{
            expiresDate = Date(timeIntervalSinceNow:expires_in)
        }
    }
    
    //过期日期
   @objc var expiresDate:Date?
    
    //用户昵称
    @objc var screen_name:String?
    
    //用户头像大图
    @objc var avatar_large:String?
    
    override var description: String{
        
        
        return yy_modelDescription()
    }
    
    override init() {
        
        super.init()
        //从磁盘加载保存的文件 ->字典
        //加载磁盘文件到二进制数据,如果失败直接返回
        guard  let path = accountFile.cz_appendDocumentDir(),
               let data = NSData(contentsOfFile:path),
               let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String:AnyObject]
        else {
            
                    return
        }
        
        
        //使用字典设置属性值
        yy_modelSet(with: dict ?? [:])
        
        //3.判断token是否过期
        
        //测试过期日期
        //expiresDate = Date(timeIntervalSinceNow:-3600 * 24)
        
        if expiresDate?.compare(Date()) != .orderedDescending {
            print("账户过期")
            
            //清空token
            access_token = nil
            uid = nil
            
            //删除账户文件
          _ = try? FileManager.default.removeItem(atPath: path)
            
        }
      
        
    }
    
    /*
     1.偏好设置
     2.沙盒 -归档 / plist/json
     3.数据库(FMDB /CoreData)
     4.钥匙串访问(自动加密  -需要使用框架 SSKeyChain)
     */
    func saveAccount(){
        
        //模型转字典
        var dict = (self.yy_modelToJSONObject() as? [String:AnyObject]) ?? [:]
        
        //删除expires_in
        dict.removeValue(forKey: "expires_in")
        
        //字典序列化data
        
        guard let  data = try?JSONSerialization.data(withJSONObject: dict, options: []),
              let filePath = accountFile.cz_appendDocumentDir()
        else{
            
            return
        }
        
        //写入磁盘
       
        (data as NSData).write(toFile: filePath, atomically: true)
        
//        print(dict)
        print("用户账户保存成功\(filePath)")
        
  
    }
    
}
