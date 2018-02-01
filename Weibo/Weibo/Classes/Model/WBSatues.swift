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
   @objc var id:Int64 = 0
    //微博信息内容
   @objc var text:String?

    @objc var pic_urls:String?


//
//    init(_ dict : [String: Any]){
//        super.init()
//       text = dict["text"] as? String
//       id = (dict["id"] as? Int64)!
//       pic_urls = dict["pic_urls"] as? String
//      setValuesForKeys(dict)
//    }
//
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//    }
//
    //重写description的计算型属性
    override var description: String{
        
        return yy_modelDescription()
        
        
    }

    
    
}
