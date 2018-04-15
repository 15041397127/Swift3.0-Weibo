//
//  WBEmoticonPackage.swift
//  表情包数据
//
//  Created by 张旭 on 2018/4/5.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import YYModel
//表情包模型
class WBEmoticonPackage: NSObject {

    @objc var groupName:String? //表情包的分组名
    
    @objc var bgImageName:String?//背景图片名称
    
    @objc var directory:String?{
        didSet{
            
            //当设置目录时  从目录下加载info.plist
            guard let directory = directory ,
                  let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
                  let bundle = Bundle(path: path),
                  let infoPath = bundle.path(forResource: "info.plist", ofType: nil, inDirectory: directory),
                  let array = NSArray(contentsOfFile: infoPath) as? [[String:String]],
                  let models = NSArray.yy_modelArray(with: WBEmoicon.self, json: array) as? [WBEmoicon]
            else{
                return
              }
       
            //遍历models数组 设置每一个表情符号的目录
            for m  in models {
                m.directory = directory
            }
            
            
            
             emoticon += models
          
            
//             [[String:String]]转成字典的数组
        }
        
    } //表情包目录 从目录下加载info,plist 可以创建表情模型数组
    
    //懒加载表情模型空数组
    //使用懒加载可以避免后续的解包
    @objc lazy var emoticon = [WBEmoicon]()
    var numberOfPages:Int{
        
        return (emoticon.count - 1)/20 + 1 //九宫格行数算法
    }
    //从懒加载的 表情包中按照page 截取最多20个表情模型的数组
    //例如总共26个
    //例如page = 0 返回0-19个模型
    //page == 1 返回20 - 25
    func emoticon(page:Int) -> [WBEmoicon]{
        
        let count = 20 //每页的数量
        let location = page * count
        var length = count
        
        //判断数组是否越界
        if location + length > emoticon.count {
            length = emoticon.count - location
        }
        
        let range = NSRange(location: location, length: length )
        //截取数组的子数组
        let subArray =  (emoticon as NSArray).subarray(with: range)
        
        return subArray as! [WBEmoicon]
    }
    
    override var description: String{
        
        return yy_modelDescription()
    }
}
