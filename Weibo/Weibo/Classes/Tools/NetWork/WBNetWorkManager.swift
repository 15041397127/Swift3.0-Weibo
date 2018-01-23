//
//  WBNetWorkManager.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/23.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import AFNetworking
//网络管理工具
class WBNetWorkManager: AFHTTPSessionManager {

    //创建单例
    //静态区/ 常量 / 闭包
    //在第一次访问时 执行闭包 并且将结果保存在shared 常量中
    static let shared = WBNetWorkManager()
}
