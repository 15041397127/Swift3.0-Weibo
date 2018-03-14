//
//  WeiboCommon.swift
//  Weibo
//
//  Created by ZhangXu on 2018/2/5.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation

//MARK: - 应用程序信息
let WBAppKey =   "1012589697"
let WBAppSecret =   "4f08aa9a4beff9338d27d365e8c63af0"
let WBRedirectURI =   "https://www.baidu.com" //回调地址

//https://api.weibo.com/oauth2/authorize?client_id=1012589697&redirect_uri=https://www.baidu.com

//MARK:全局通知定义

let WBUserShouldLoginNotification = "WBUserShouldLoginNotification"

//用户登录成功通知
let WBUserLoginSuccessNotification = "WBUserLoginSuccessNotification"


//MARK:微博视图常量
//微博视图外侧间距
let WBStatusPictureViewOutterMargin = CGFloat(12)
//内部视图的间距
let WBStatusPictureViewInnerMargin = CGFloat(3)
//屏幕宽度
let WBStatusPictureViewWidth = UIScreen.cz_screenWidth() - 2 * WBStatusPictureViewOutterMargin
//每个item默认宽度
let WBStatusPictureItemWidth = (WBStatusPictureViewWidth - 2 * WBStatusPictureViewInnerMargin)/3
