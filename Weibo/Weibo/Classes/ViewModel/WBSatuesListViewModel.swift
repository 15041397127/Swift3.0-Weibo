//
//  WBSatuesListViewModel.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/24.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation
import SDWebImage
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
    //微博视图模型数组懒加载
    lazy var statuesLsit = [WBSatuesViewModel]()
    
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
        let since_id = pullUp ?0:statuesLsit.first?.status.id ?? 0
        
         //max_id 取出数组中最后一条微博的id
        let max_id = !pullUp ?0:statuesLsit.last?.status.id ?? 0
        
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


            //判断网络请求是否成功
            
            if !isSuccess {
                
                completion(isSuccess,false)
                
                return
            }
            
            
            
            //1.字典转模型(所有第三方框架都支持嵌套的字典转模型)
            
            //1> 定义结果可变数组
            
            var array = [WBSatuesViewModel]()
        
            //2> 遍历服务器返回的字典数组 字典转模型
            
            for dict  in list ?? [] {
                
                //a)创建微博模型 -如果创建模型失败 继续后续的遍历
                guard  let model = WBSatues.yy_model(with: dict) else{
                    
                    continue
                }
                
                //b) 将视图 model 添加到数组
                
                array.append(WBSatuesViewModel(model:model))
            }
            
            
//            guard  let array = NSArray.yy_modelArray(with: WBSatues.self, json: list ?? []) as? [WBSatues] else{
//
//                completion(isSuccess,false)
//                return
//            }
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
         
                self.cacheSingleImage(list: array, finished: completion)
                
//                completion(isSuccess,true)
            }

        }
    }
    
    
    
    /// 缓存本次下载微博数据组中的单张图像
    ///
    /// - 应该缓存单张图片并且修改配图大小之后再回调 才能保证表格等比例显示单张图像
    /// - Parameter list: 本次下载的视图模型数组
    private func cacheSingleImage(list:[WBSatuesViewModel], finished:@escaping(_ isSuccess:Bool,_ shouldRefresh:Bool) -> ()){
        //调度组
        let group = DispatchGroup()

        //记录数据长度
        var length = 0
        //遍历数组 查找微博数据中有单张图像的 进行缓存
        //option cmd  左折叠代码
        for vm  in list {
            
            //1.判断图像数量
            if vm.picURLs?.count != 1{
                continue
            }
            //2.获取图像模型
            guard let pic = vm.picURLs?[0].thumbnail_pic,
                  let url =  URL(string:pic)   else{
                
                continue
                
            }
           
            //3下载图片
            //downloadImage 是sdwebImage 核心方法
            //图像下载完成之后 会自动保存在沙盒中 文件路径是url的md5
            //如果沙盒中已经存在的缓存图像 后续使用SD 通过url加载图像 都会加载本地沙盒图像
            //不会发起网络请求 同时回调方法会调用
            //方法一样 调用一样 不过内部不会再发起网络请求
            
            
            //入组
            group.enter()
            
            SDWebImageManager.shared().imageDownloader?.downloadImage(with: url, options: [], progress: nil, completed: { (image, _, _, _ ) in
                
                
                //将图片转成二进制数据
                if let image = image,
                    let data = UIImagePNGRepresentation(image){
                    
                    //NSData 是length属性
                    length += data.count
                }
                print("缓存的图像是\(String(describing: image))长度\(length)")
                
                //出组 放在回调的最后一句
                group.leave()
            })
            
        }
        group.notify(queue: DispatchQueue.main) {
            
            print("图片缓存完成\(length/1024)k")
            //执行闭包回调
            finished(true,true)
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
