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
    
    //微博创建时间字符串
    @objc var created_at:String?
    
    //微博来源 
    @objc var source:String?{
        didSet{
            
            //重新计算来源并且保存
            //在didSet 给source再次设值 不会调用didSet
            source = "来自" + (source?.zx_href()?.text ?? "")
        }
    }
    
    /// 转发数
      @objc  var reposts_count: Int = 0
   /// 评论数
      @objc var comments_count: Int = 0
   /// 表态数
      @objc var attitudes_count: Int = 0
    

//    @objc var pic_urls:String?
    
    //微博用户  主要要和服务器返回的key要一样
    @objc var user:WBUser?

    
    @objc var pic_urls:[WBStatusPicture]?
    
    //被转发的原创微博
    @objc var retweeted_status:WBSatues?
    

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
    
    /*
     告诉第三方框架`YYModel`,如果遇到数组类型的属性,数组中存放的对象是什么类
     NSArray 中保存对象的类型通常是`id`类型
     OC 中的泛型是 Swift 推出后,苹果为了兼容给 OC 增加的
     从运行时的角度,仍然不知道数组中应该存放什么类型的对象
     */
    //类函数
    @objc class  func  modelContainerPropertyGenericClass() -> [String : AnyClass] {
        return ["pic_urls" : WBStatusPicture.self]
    }
 

}
