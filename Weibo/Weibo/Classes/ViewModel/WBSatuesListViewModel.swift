//
//  WBSatuesListViewModel.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/24.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation
//微博数据列表视图模型
/*
 父类选择
 -如果类需要使用"KVC"或者字典转模型框架设置对象值,类就需要继承NSObject
 
 -如果类只包装一些代码逻辑,可以不用任何父类 好处更加轻量级
 
 - OC一律继承NSObject
 */

//负责微博的数据处理
//1.字典转模型
//2.下来/上拉刷新数据处理

//上拉刷新量最大尝试次数
private let  maxPullupTryTimes = 3


class WBSatuesListViewModel {
    //微博模型数组懒加载
    lazy var statuesLsit = [WBSatues]()
    
    //上拉刷新错误次数
    private var maxPullupErrorTimes = 0
    
    lazy var ljArray : [WBSatues] = [WBSatues]()
    /// 加载微博列表
    ///
    ///- Parameter pullUp: 是否上啦刷新标记
    /// - Parameter completion: 完成回调 是否刷新表格
    func loadStatues(pullUp:Bool, completion:@escaping(_ isSuccess:Bool,_ shouldRefresh:Bool) -> ()){
        
        //判断是否是上拉刷新,同时检查刷新错误
        if pullUp && maxPullupErrorTimes > maxPullupErrorTimes {
            completion(true,false)
            
            return
        }
        
        
        //since_id 取出数组中第一条微博的id
        let since_id = pullUp ?0:statuesLsit.first?.id ?? 0
        
         //max_id 取出数组中最后一条微博的id
        let max_id = !pullUp ?0:statuesLsit.last?.id ?? 0
        
        WBNetWorkManager.shared.statusList(since_id: since_id, max_id: max_id){ (list, isSuccess) in
            
        
            //原生解析
            /*
            let data = try? JSONSerialization.data(withJSONObject: list as Any, options: [])
  
            let str = String(data:data!, encoding: String.Encoding.utf8)
            
            guard let allResulrDict = self.getDictionaryFromJSONString(jsonString:str!) as? [[String : Any]] else {return}
            
         
            for dict in allResulrDict{
          
                let status = WBSatues(dict)
       
                
                status.text = (dict["text"] as! String)
                
                let aaaa  = Statuse.init(fromDictionary: dict)
           
                 self.statuesLsit += status
                
           //  下拉刷新,应该讲结果拼接在数组的前面
                
                
                self.statuesLsit = [status] + self.statuesLsit
                self.statuesLsit.insert(status, at: 0)
               
             self.statuesLsit.append(status)

                
            }
            */


            //1.字典转模型(所有第三方框架都支持嵌套的字典转模型)
            guard  let array = NSArray.yy_modelArray(with: WBSatues.self, json: list ?? []) as? [WBSatues] else{

                completion(isSuccess,false)
                return
            }
            print("刷新到\(array.count)条数\(array)")
            
                 //2.拼接数据
            if pullUp {
                
                //上拉刷新结束后将数据拼接在数组的末尾
                self.statuesLsit += array
            }else{
                //下拉刷新 应该将结果数组拼接在数组前面
                 self.statuesLsit = array + self.statuesLsit
            }

            //3.完成回调
            //判断上拉刷新的数据量
            if pullUp && array.count == 0{
                
                self.maxPullupErrorTimes += 1
                completion(isSuccess,false)
            }else{
         
                completion(isSuccess,true)
            }
            
         
            
        }
    }
    
    
    func getDictionaryFromJSONString(jsonString:String) ->NSArray{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
        if dict != nil {
            return dict as! NSArray
        }
        return NSArray()
    }
}
