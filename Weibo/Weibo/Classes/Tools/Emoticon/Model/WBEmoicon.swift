//
//  WBEmoicon.swift
//  表情包数据
//
//  Created by 张旭 on 2018/4/5.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import YYModel
class WBEmoicon: NSObject {

    //表情类型false是图片表情  true -emoji
   @objc var type = false
   @objc var chs:String? //表情字符串 发送给服务器 节约流量
   @objc var png:String? //表情图片名称 用于图文混排
    //十六进制编码
   @objc var code:String?{
        didSet{
            guard let code = code else {
                return
            }
            let scanner = Scanner(string: code)
            var result:UInt32 = 0
            scanner.scanHexInt32(&result)
            emoji = String(Character(UnicodeScalar(result)!))
        }
    }
    //emoji的字符串
   @objc var emoji:String?
    //表情模型所在的目录
   @objc var directory:String?
   
    //图片 表情对应的图像
    @objc var image:UIImage?{
        //计算性属性
        //判断表情类型
        if type {
            return nil
        }
        
        guard let directory = directory,
              let png = png,
             let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
             let bundle = Bundle(path: path)
        else{
            return nil
        }
        return UIImage(named: "\(directory)/\(png)", in: bundle, compatibleWith: nil)
    }
    
    //当前图像转换成图片的属性文本
    @objc func imageText(font:UIFont) -> NSAttributedString{
    
    //判断图像是否存在
    guard let image = image else {
        return NSAttributedString(string: "")
    }
    //创建文件附件
     let attachment = NSTextAttachment()
     attachment.image = image
     let height = font.lineHeight
     attachment.bounds = CGRect(x: 0, y: -4, width: height, height: height)
   
        return NSAttributedString(attachment: attachment)
    }
    
    override var description: String{
        
        return yy_modelDescription()
        
    }
}
