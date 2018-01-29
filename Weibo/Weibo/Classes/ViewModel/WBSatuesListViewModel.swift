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
        
        WBNetWorkManager.shared.statusList { (list, isSuccess) in
            
            
          
            let data = try? JSONSerialization.data(withJSONObject: list as Any, options: [])
  
            let str = String(data:data!, encoding: String.Encoding.utf8)
            
            guard let allResulrDict = self.getDictionaryFromJSONString(jsonString:str!) as? [[String : Any]] else {return}
            
//           self.ljArray.append(WBSatues(allResulrDict))
            
            var aaaaaa : [WBSatues] = [WBSatues]()
          
            for dict in allResulrDict{
//                self.ljArray.append(WBSatues(dict))
            
                
                
//                aaaaaa.append(WBSatues(dict))
//               self.statuesLsit.append(WBSatues(dict))
                var status = WBSatues(dict)
       
                status.text = (dict["text"] as! String)
                
                
     
//                 self.statuesLsit += status
                
               
//                self.ljArray.append(status)
             self.statuesLsit.append(status)
            
           
    
//            guard  let model = HQStatus.yy_model(with: dict)else{
//
//                    completion(isSuccess)
//                return
//            }

//                guard  let array = NSDictionary.yy_modelDictionary(with:HQStatus.self, json: dict) as? [HQStatus] else{
//
//                completion(isSuccess)
//                return
//            }
//            print(array)
//
        
                
            }
            
        
            
//            print(self.ljArray)
//         print(self.ljArray[0])
            
//               self.statuesLsit += self.ljArray
            
//            print(self.statuesLsit[1])
            
            
//            var arrayM = [HQStatusViewModel]()
//
//            for dict in list ?? [] {
//
//                print((dict as AnyObject)["text"])
//
//                let wwww = dict["text"] as? String
//
//                print(wwww)
                //                for aaa in dict {
                //
                //
                //                    print(aaa)
                //
                //                }

                               // 创建微博模型
//                              let status = HQStatus()
//                let aa = NSDictionary.yy_modelDictionary(with:HQStatus.self, json: dict)
//                print(aa)
            
                
//                let aaa = NSArray.yy
                
               
                
                
                        //1.字典转模型
//                           guard  let array = NSArray.yy_modelArray(with: WBSatues.self, json: list ?? []) as? [WBSatues] else{
//
//                                    // 字典转模型
//                                        status.yy_modelSet(with: dict)
//                                         print(status.text)
//
//                                    let vvvv = status.text as? String
//
//
//                                      print(HQStatus.yy_model(with: dict))
//
//                                    // 使用`HQStatus`创建`HQStatusViewModel`
//                                    let viewModel = HQStatusViewModel(model: status)
//                                   print(viewModel.status.text)
//                                   // 添加到数组
//                            return
//
//                }
//            }
            
            
            
            
            
            
            
            
            
            //1.字典转模型
//            guard  let array = NSArray.yy_modelArray(with: WBSatues.self, json: list ?? []) as? [WBSatues] else{
//
//                completion(isSuccess)
//                return
//            }
//
//            for dict in list ?? []{
//                //创建微博模型--如果创建失败，则继续遍历
//            let model = WBSatues.yy_model(with: dict)
//            print(model)
////                else{
////                    continue
////                }
////
////                array.append(MJStatusViewModel(model: model))
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
