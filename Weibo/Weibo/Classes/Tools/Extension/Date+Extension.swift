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
//当前日历对象
private let calendar = Calendar.current
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
    
    
    /// 将新浪格式的字符转成日期
    ///
    /// - Parameter string: 新浪格式的
    /// - Returns: 日期
    static func wb_sinaDate(string:String) -> Date? {
        
        //1.设置日期格式
        dateFormater.dateFormat = "EEE MMM dd HH:mm:ss zzz yyyy"
        
        //2转换并且返回日期
     return dateFormater.date(from: string)
 
    }
    
    /*
     刚刚
     x分钟内
     x小时前
     昨天
     一年内
     更早期
     */
    var wb_dateDescription:String{
        
        //判断日期是否是今天
        if calendar.isDateInToday(self) {
            let delta = -Int(self.timeIntervalSinceNow)

            if delta < 60{
                return "刚刚"
            }

            if delta < 3600{
                return "\(delta / 60)分钟前"
            }

            return "\(delta / 3600 )小时前"
        }
        
        //其他天
        var fmt = "HH:mm"
        if calendar.isDateInYesterday(self) {
            fmt = "昨天" + fmt
        }else{
            
            fmt = "MM-dd" + fmt
            let year =  calendar.component(.year, from: self)
            let thisYear =  calendar.component(.year, from: Date())
            if year  != thisYear{
                
                fmt = "yyyy-" + fmt
            }
        }
        
        //设置日期格式字符串
        dateFormater.dateFormat = fmt
        return dateFormater.string(from: self)
    }
    
}
