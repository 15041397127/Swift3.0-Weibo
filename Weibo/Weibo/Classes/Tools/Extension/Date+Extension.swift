//
//  Date+Extension.swift
//  Weibo
//
//  Created by ZhangXu on 2018/4/18.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation
//日期格式化器 不要频繁的释放和创建 会影响性能
private let dateFormater = DateFormatter()
extension Date{
    
    
    /// 计算与当前系统时间偏差 delta秒数日期的字符串
    ///
    /// - Parameter delta: <#delta description#>
    /// - Returns: <#return value description#>
    //在swift中 如果要定义结构体的"类"函数 使用static 修饰静态函数
    static func wb_dateString(delta:TimeInterval) -> String{
        
        let date = Date(timeIntervalSinceNow: delta)
        //指定日期格式
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormater.string(from: date)
    }

}
