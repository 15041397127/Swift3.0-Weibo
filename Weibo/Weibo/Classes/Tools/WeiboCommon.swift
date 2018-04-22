//
//  WeiboCommon.swift
//  Weibo
//
//  Created by ZhangXu on 2018/2/5.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation

//MARK: - 应用程序信息
let WBAppKey =   "4010704658"
let WBAppSecret =   "91deb8b8259f94aab35b930290714754"
let WBRedirectURI =   "https://www.baidu.com" //回调地址

//https://api.weibo.com/oauth2/authorize?client_id=1012589697&redirect_uri=https://www.baidu.com

//MARK:全局通知定义

let WBUserShouldLoginNotification = "WBUserShouldLoginNotification"

//用户登录成功通知
let WBUserLoginSuccessNotification = "WBUserLoginSuccessNotification"

/// 照片浏览通知定义
///
/// @param selectedIndex    选中照片索引
/// @param urls             浏览照片 URL 字符串数组
/// @param parentImageViews 父视图的图像视图数组，用户展现和解除转场动画参照
///
/// @return 微博cell 的浏览照片通知
let WBStatusCellBrowserPhotoNotication = "WBStatusCellBrowserPhotoNotication"
//选中索引
let WBStatusCellBrowserPhotoSelectedInexKey = "WBStatusCellBrowserPhotoSelectedInexKey"
//浏览照片URL字符串key
let WBStatusCellBrowserPhotoURlsKey = "WBStatusCellBrowserPhotoURlsKey"
// 父视图的图像视图数组，用户展现和解除转场动画参照
let WBStatusCellBrowserPhotoImageViewsKey = "WBStatusCellBrowserPhotoImageViewsKey"


//MARK:微博视图常量
//微博视图外侧间距
let WBStatusPictureViewOutterMargin = CGFloat(12)
//内部视图的间距
let WBStatusPictureViewInnerMargin = CGFloat(3)
//屏幕宽度
let WBStatusPictureViewWidth = UIScreen.cz_screenWidth() - 2 * WBStatusPictureViewOutterMargin
//每个item默认宽度
let WBStatusPictureItemWidth = (WBStatusPictureViewWidth - 2 * WBStatusPictureViewInnerMargin)/3
