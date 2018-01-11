//
//  Bundle+Extensions.swift
//  反射机制抽取
//
//  Created by ZhangXu on 2018/1/8.
//  Copyright © 2018年 zhangXu. All rights reserved.
//

import Foundation

extension Bundle{
    
//    func nameSpace() -> String{
//
////     return   Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""  也对这个
//
////
//        return   infoDictionary?["CFBundleName"] as? String ?? ""
//
//    }
    
    //计算型属性 类似于函数 没有参数 有返回值
    var nameSpace:String {
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }

}

