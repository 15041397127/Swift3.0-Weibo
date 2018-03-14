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
    
    //缩略图
    @objc var thumbnail_pic:String?
    
    
    
    override var description: String{
        
        return yy_modelDescription()
    }

}
