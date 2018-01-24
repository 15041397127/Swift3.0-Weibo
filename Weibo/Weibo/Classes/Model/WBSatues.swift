//
//  WBSatues.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/24.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import YYModel
//微博数据模型
class WBSatues: NSObject {
    
    //Int类型在64位机型是64的 32位是32位 若不写64 在老旧机型上都无法正常运行
    var id:Int64 = 0
    //微博信息内容
    var text:String?
    
    var pic_urls:String?
    //重写description的计算型属性
    override var description: String{
        
        return yy_modelDescription()
        
    }
}
