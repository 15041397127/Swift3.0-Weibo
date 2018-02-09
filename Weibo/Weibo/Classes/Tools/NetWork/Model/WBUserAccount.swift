//
//  WBUserAccount.swift
//  Weibo
//
//  Created by 张旭 on 2018/2/9.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBUserAccount: NSObject {
    
    //访问令牌
    @objc var access_token:String?
    //用户代号
    @objc var uid:String?

    //access_token的生命周期，单位是秒
    //开发者5年
    //测试使用者3天
    var expires_in:TimeInterval = 0
    
    override var description: String{
        
        
        return yy_modelDescription()
    }
}
