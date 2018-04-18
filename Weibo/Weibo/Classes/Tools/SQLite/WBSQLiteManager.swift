//
//  WBSQLiteManager.swift
//  数据库FMDB
//
//  Created by ZhangXu on 2018/4/16.
//  Copyright © 2018年 zhangXu. All rights reserved.
//

import Foundation
import FMDB
//往前加5天
//private let maxDBCacheTime:TimeInterval = -5 * 24 * 60 * 60 //数据库缓存时间 以秒为单位 5天
private let maxDBCacheTime:TimeInterval = -60 //测试时间
//SQLite管理器
/*
  1.数据库本质上是保存在沙盒中的一个文件,首先需要创建并且打开数据库
    FMDB队列
  2.创建数据表
  3.增删改查
 提示:数据库开发 程序代码几乎都是一致的 区别在SQL
 开发数据库功能的时候 首先一定要在navicat中测试SQL的正确性
*/
class WBSQLiteManager {
    
    //单例  全局数据库工具访问点
    static let shared = WBSQLiteManager()
    
    let queue:FMDatabaseQueue
    
    //构造函数
    private init() {
        //数据库的全路径 -path
        let dbName = "status.db"
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        path = (path as NSString).appendingPathComponent(dbName)
        print("数据库的路径" + path)
        
        //创建数据库队列 同时创建或者打开数据库
        queue = FMDatabaseQueue(path:path)
        //打开数据库
        createTable()
        
        //注册通知 监听应用程序进入后台
        //模仿sdwebImage
        NotificationCenter.default.addObserver(self, selector: #selector(clearDBCache), name: Notification.Name.UIApplicationDidEnterBackground, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //清理数据缓存
    //注意细节 SQLite不断增加数据 数据库文件会不断的增加
    //但是 如果删除了数据 数据库不会变小
    //如果要变小 1.将数据库文件复制一个新的副本 status.db.old 2.创建一个空的数据库文件 3.自己编写sQL 从old中将所有的数据读出 写入新的数据库
    @objc private func clearDBCache(){
        
        let dateString = Date.wb_dateString(delta: maxDBCacheTime)
        //准备sqL
        let sql = "DELETE FROM T_Status WHERE creatTime < ?;"
        //执行sqL
        queue.inDatabase { (db) in
            
            if db.executeUpdate(sql, withArgumentsIn: [dateString]) == true {
                
                print("删除了多少条\(db.changes)")
                
            }
            
        }
        
    }
    
}

//MARK: -微博数据操作
extension WBSQLiteManager{
    
    
    /// 从数据库加载微博数据数组
    ///
    /// - Parameters:
    ///   - userId: 当前登录的用户账号
    ///   - since_id: 返回比since_id大的微博
    ///   - max_id: 返回比 max_id小的微博
    /// - Returns: 微博的字典的数组 将数据库中status对应的二进制数据反序列化生成字典
    func loadStatus(userId:String,since_id:Int64 = 0,max_id:Int64 = 0) -> [[String:AnyObject]]
    {
        //1.准备SQL
        var sql = "SELECT statusId,userId,status FROM T_Status \n"
        sql += "WHERE userId = \(userId) \n"
        
        //上拉下拉 都是针对一个id进行判断
        
        if since_id > 0 {
            sql += "AND statusId > \(since_id) \n"
        }else if max_id > 0{
            
            sql += "AND statusId < \(max_id) \n"
        }
        
        sql += "ORDER BY statusId DESC LIMIT 20;"
        
        //拼接sql一定 要测试
//        print(sql)
        
        //2.执行SQL
        let array = execRecordSet(sql: sql)
        
        //3.遍历数组 将数组中的status 反序列化 -> 字典的数组
        var result = [[String:AnyObject]]()
        
        for dict in array {
            //反序列化
            guard let jsonData = dict["status"] as? Data,
                  let json =  try?JSONSerialization.jsonObject(with: jsonData, options:[]) as? [String:AnyObject] else
            {
                continue
            }
          //追加到数组
            result.append(json ?? [:])
            
        }
    
      return result
    }
    
    /*
       从网络加载结束后,返回的是微博的"字典数组" 每一个字典对应一个完整的微博记录
       -完整的微博记录中包含微博的代号
       -微博记录中没有当前用户登录的useId
     */
    
    ///  新增或者修改微博数据 微博数据在属性的时候 可能会出现重叠
    ///
    /// - Parameters:
    ///   - userId: 当前登录用户的id
    ///   - array: 从网络获取的字典的数组
    func updateSatues(userId:String,array:[[String:AnyObject]]){
        //1.准备SQL
        /*
         statusId: 要保存的微博代号
         userId: 当前登录用户的id
           status:完整微博字典的json二进制数据
         */
        let sql = "INSERT OR REPLACE INTO T_Status (statusId,userId,status) VALUES (?,?,?);"
        //2.执行SQL unsageMutablePointer<ObjCBool> bool的指针
        queue.inTransaction { (db, rollback) in
              //遍历数组,逐条插入微博数据
              //将字典序列化成二进制数据 将字典序列化成二进制数据
            for dict in array {
                
                guard let statusId = dict["idstr"] as? String,
                      let jsonData = try?JSONSerialization.data(withJSONObject: dict, options: [])
                else {
                    continue
                }
                //执行SQL
                if db.executeUpdate(sql, withArgumentsIn: [statusId,userId,jsonData]) == false{
                    //xcode的自动语法转换 不会处理此处
                    //需要回滚: *rollback = yes;
                    //Swift 1.x和2.x rollback.memor = ture
                    rollback.pointee = true
                    break
                }
                //模拟回滚
//                rollback.pointee = true
//                break

            }
        }
    }
    
}


//MARK:创建微博数据表以及其他私有方法
 extension WBSQLiteManager{
    
    //查询
    /// 执行一个SQL 返回字典的数组
    ///
    /// - Parameter sql: sql
    /// - Returns: 字典的数组
    func execRecordSet(sql:String) ->[[String : AnyObject]]{
        
        //结果数组
        var reslut = [[String:AnyObject]]()
        
        //执行sql -查询数据 所有不需要开启事务
        //事务的目的 是为了保证数据的有效性 一旦失败 回滚到初始状态
        queue.inDatabase { (db) in
            guard let rs = db.executeQuery(sql, withArgumentsIn: []) else{
                return
            }
          //逐行 - 遍历结果集合
            while rs.next(){
                
                //1.列数
                let colCount = rs.columnCount
                
                //遍历所有列
                for col in 0..<colCount{
                     //3列名-> key  //值 -> value
                    guard let name = rs.columnName(for: col),
                          let value = rs.object(forColumnIndex: col)
                        else{
                            continue
                    }
                    //追加结果
                    reslut.append([name:value as AnyObject])
                    
                }
                
            }
            
        }
        
        return reslut
        
    }
    
    
    //创建数据表
    func createTable(){
        
        //1.SQL
        guard  let path = Bundle.main.path(forResource: "status.sql", ofType: nil),
               let sql = try?String(contentsOfFile: path)
        else {
            return
        }
  
       
        //2.执行SQL FMDB内部队列 串行队列 同步执行
        //可以保证同一时间 只有一个任务操作数据库 从而保证数据库的读写安全
        queue.inDatabase { (db) in
            //只有创表的时候 使用执行多条语句  可以一次创建多个数据表
            //在执行增删改查的时候 一定不要使用 statements方法 否则有可能会被注入
            if db.executeStatements(sql) == true{
                
            
            }else{
           
            }
        }
    }

}
