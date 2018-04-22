//
//  WBStatusPicture.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/14.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//微博配图模型
class WBStatusPicture: NSObject {
    
    //缩略图 -新浪返回的缩略图不好
    @objc var thumbnail_pic:String?{
        
        didSet{
            //更改缩略图地址
            thumbnail_pic = thumbnail_pic?.replacingOccurrences(of:"/thumbnail/", with: "/wap360/")
        }
    }
    
    
    
    override var description: String{
        
        return yy_modelDescription()
    }

}
