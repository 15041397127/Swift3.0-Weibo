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


class WBSatuesListViewModel {
    //微博模型数组懒加载
    lazy var statuesLsit = [WBSatues]()
    lazy var ljArray : [WBSatues] = [WBSatues]()
    /// 加载微博列表
    ///
    /// - Parameter completion: 完成回调 
    func loadStatues(completion:@escaping(_ isSuccess:Bool) -> ()){
        
        //since_id 取出数组中第一条微博的id
        let since_id = statuesLsit.first?.id ?? 0
        
        let max_id = statuesLsit.last?.id ?? 0
        
        WBNetWorkManager.shared.statusList(since_id: since_id, max_id: max_id){ (list, isSuccess) in
            
            
          
            let data = try? JSONSerialization.data(withJSONObject: list as Any, options: [])
  
            let str = String(data:data!, encoding: String.Encoding.utf8)
            
            guard let allResulrDict = self.getDictionaryFromJSONString(jsonString:str!) as? [[String : Any]] else {return}
            
         
            for dict in allResulrDict{
          
                let status = WBSatues(dict)
       
                
//                status.text = (dict["text"] as! String)
                
//                let aaaa  = Statuse.init(fromDictionary: dict)
           
//                 self.statuesLsit += status
                
             //下拉刷新,应该讲结果拼接在数组的前面
                
                
//                self.statuesLsit = [status] + self.statuesLsit
                self.statuesLsit.insert(status, at: 0)
               
//             self.statuesLsit.append(status)

                
            }
            


            //1.字典转模型
//            guard  let array = NSArray.yy_modelArray(with: HQStatus.self, json: list ?? []) as? [HQStatus] else{
//
//                completion(isSuccess)
//                return
//            }

            
            //2.拼接数据
//            self.statuesLsit += array
            //3.完成回调
            completion(isSuccess)
            
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
