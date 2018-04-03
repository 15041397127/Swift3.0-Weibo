//
//  String+Extensions.swift
//  正则体验
//
//  Created by ZhangXu on 2018/4/3.
//  Copyright © 2018年 zhangXu. All rights reserved.
//

import Foundation
extension String{
    
    //从当前方法字符串中 ,提取链接和文本
    //swift 提供元组
    //OC 可以返回字典 自定义对象 指针的指针
    func zx_href() -> (link:String,text:String)?{
        
        let pattern = "<a href=\"(.*?)\".*?>(.*?)</a>"
        
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []),
               let rerult = regx.firstMatch(in: self, options: [], range:NSRange(location: 0, length: String(self).count))else{
            return nil
        }
       
        let link = (self as NSString).substring(with: rerult.range(at: 1))
        let text = (self as NSString).substring(with: rerult.range(at: 2))
   
//        print(link + "----" + text)
        
        return (link,text)
    }

}
