//
//  WBEmoticonManager.swift
//  表情包数据
//
//  Created by 张旭 on 2018/4/5.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation
import UIKit
//表情单例
class WBEmoticonManager {
    
    static let shared = WBEmoticonManager()
    
    //表情包的懒加载数组 -第一个数组是最近的表情 加载之后 表情数组为空
    @objc lazy var packages = [WBEmoticonPackage]()
    
    //表情素材的bundle
    lazy var bundle:Bundle = {
        let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil)
        return Bundle(path: path!)!
    }()
    
    //构造函数 如果在init 之前增加private 修饰符 可以要求调用这必须通过 shared访问对象
    //OC要 重写allocWithZone方法
    private init() {
        loadPackage()
    }
    
    
    /// 添加最近使用的表情
    ///
    /// - Parameter em: 选中的表情
    func recentEmoticon(em:WBEmoicon){
        //1. 增加表情的使用次数
        em.times += 1

        //2.判断是否已经记录了表情 如果没有记录 添加记录
        if !packages[0].emoticon.contains(em) {
            packages[0].emoticon.append(em)
        }
        
        
        //3.根据使用次数排序 使用次数多的排序靠前
        //对当前数组排序
//        packages[0].emoticon.sort { (em1, em2) -> Bool in
//
//            return em1.times > em2.times
//
//        }
        //在swift中 如果闭包只有一个return 参数可以省略 参数名 用$0..替代
        packages[0].emoticon.sort {
            
            $0.times > $1.times
        
        }
        
        
        //4.判断表情数据是否超出20  如果超出 删除末尾的表情
        if packages[0].emoticon.count > 20 {
            
           packages[0].emoticon.removeSubrange(20..<packages[0].emoticon.count)
        }
        
    
    }
    
}
//MARK:表情符号处理
extension WBEmoticonManager{
    
    
    /// 将给定的字符串转换成属性文本
    ///
    /// - Parameter string: 完整的字符串
    /// - Returns: 属性文本
    func emoticonString(string:String,font:UIFont) -> NSAttributedString{
        
        let attrString = NSMutableAttributedString(string: string)
        
        //建立正则表达式 过滤所有的表情文字
        //[] () 都是正则表达式的关键字 如果要参与匹配 需要转义
        let pattern = "\\[.*?\\]"
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else{
            return attrString
        }
        
        //匹配所有项
        
        let matches = regx.matches(in: string, options: [], range:NSRange(location: 0, length: attrString.length) )
        
        //倒叙遍历
        for m in matches.reversed() {
            
            let r = m.range(at: 0)
            let subStr = (attrString.string  as NSString).substring(with: r)
            
            
            //使用subStr查找对应的表情符号
            if let em = WBEmoticonManager.shared.findEmoticon(string: subStr){
                print(em)
                
                //使用表情符号中的属性文本 替换原有的属性文本内容
                attrString.replaceCharacters(in: r, with: em.imageText(font:font))
                
            }
            
        }
        
        //4.统一设置一遍字符串的属性NSFontAttributeName 必须要写 否则整体布局会错乱 除了要设置字体还要设置颜色
        attrString.addAttributes([NSAttributedStringKey.font:font,
                                  NSAttributedStringKey.foregroundColor:UIColor.darkGray], range: NSRange(location: 0, length: attrString.length))
        
        return attrString
        
    }
    
    
    /// 根据string在所有表情符号中查找对应的表情模型对象
    /// - 如果找到 返回表情模型 找不到返回nil
    /// - Parameter string: <#string description#>
    /// - Returns: <#return value description#>
    func findEmoticon(string:String) -> WBEmoicon?{
        
        for p in packages {
            
            //在表情包数组中过滤string OC中过滤数组用谓词
            //方法1
//          let result = p.emoticon.filter({ (em) -> Bool in
//
//                return em.chs == string
//            })
            //方法2 -尾随闭包
//            let result = p.emoticon.filter() { (em) -> Bool in
//
//                return em.chs == string
//            }
            
            //方法3 如果闭包中只有一句 并且是返回
            //闭包格式定义可以省略
            //参数省略之后 使用$0 $1一次替代原有的参数
//            let result = p.emoticon.filter() {
//                return $0.chs == string
//            }
            
            //方法4 return也可省略
            let result = p.emoticon.filter() {$0.chs == string}
            
            
            //判断结果数组的数量
            if result.count == 1{
                
                return result[0]
            }
            
        }
        
        
        return nil
    }
}

//MARK:表情包数据处理
private extension WBEmoticonManager{
    
    func  loadPackage(){
        //读取plist文件
        //只要按照 bundle默认的目录结构设定 就可以直接读取Resources目录下的文件
      guard let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
            let bunlde = Bundle(path: path),
            let plistPath = bunlde.path(forResource: "emoticons.plist", ofType: nil),
            let array =  NSArray(contentsOfFile: plistPath) as? [[String:String]],
            let models = NSArray.yy_modelArray(with: WBEmoticonPackage.self, json: array) as? [WBEmoticonPackage]
             else{
            return
             }
  
        //设置表情包数据
        // 使用 += 不需要再次给packages 分配空间 直接最加数据
         packages += models
        
    }

}
