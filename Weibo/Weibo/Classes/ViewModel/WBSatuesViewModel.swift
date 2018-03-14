//
//  WBSatuesViewModel.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import Foundation

//单条的微博视图模型
/*
   如果没有任何父类 如果希望在开发时调试 输出调试信息 需要
   1.CustomStringConvertible
   2.实现 description
 */

//关于表格的性能优化

//-尽量少计算 所有需要的素材提前计算好
//- 控件上不要设置圆角半径 所有图像渲染的属性 都要注意
// -不要动态创建控件  所有需要的控件 都要提前创建好 在显示的时候 根据数据隐藏 / 显示
//-cell中控件的层次越少越好 数量越少越好
//-要测量 不要猜测

class WBSatuesViewModel:CustomStringConvertible {
    
    //微博模型
    var status:WBSatues
    
    //存储型属性 用内存换CPU
    var memberIcon:UIImage?
    
    ///认证类型 -1：没有认证  0：认证用户 2，3，5：企业认证 220：达人
    var vipIcon:UIImage?
    
    //转发文字
    var reteetedStr:String?
    //评论文字
    var commentStr:String?
    //点赞文字
    var likeStr:String?

    //配图视图大小
    var pictureViewSize = CGSize()
    
    /// 构造函数
    ///
    /// - Parameter model: 微博模型
    /// - return:微博的视图模型
    init(model:WBSatues) {
        self.status = model
        
        ///会员等级 0-6  common_icon_membership_level1
        
        if (model.user?.mbrank)! > 0 && (model.user?.mbrank)! < 7{
            
            let imageName = "common_icon_membership_level\(model.user?.mbrank ?? 1)"
            
            memberIcon = UIImage(named: imageName)
        }
        
        //认证图标
        switch model.user?.verified_type ?? -1 {
        case 0:
            vipIcon = UIImage(named: "avatar_vip")
        case 2,3,5:
            vipIcon = UIImage(named: "avatar_enterprise_vip")
        case 220:
            vipIcon = UIImage(named: "avatar_grassroot")
        default:
            break
        }
        //设置底部计数字符串
        
        //测试超过10000的数字
//        model.reposts_count = Int(arc4random_uniform(100000))
        
        reteetedStr = countString(count: status.reposts_count, defautStr: "转发")
        commentStr = countString(count: status.comments_count, defautStr: "评论")
        likeStr = countString(count: status.attitudes_count, defautStr: "赞")
        
        //计算配图视图大小
        
        pictureViewSize = calcPictureViewSize(count: status.pic_urls?.count)
        
        
        
    }
    
    var description: String{
        
        return status.description
        
    }
    
    
    //
    /// 计算指定数量的图片对应的配图视图的大小
    ///
    /// - Parameter count: 图片数量
    /// - Returns: 图片的大小
    private func calcPictureViewSize(count:Int?) -> CGSize{
        
        if count == 0 || count == nil {
            return CGSize()
        }
        
        //1.计算宽度

        //计算高度
        //计算行数 根据conut 1 ~ 9
        /*
           1 2 3 = 0 1 2 /3 = 0
           4 5 6 = 3 4 5 /3 = 1
           7 8 9 = 6 7 8 /3 = 2
         */
        let row = (count! - 1) / 3 + 1
        
        //根据行数算高度
        
       var  height  = WBStatusPictureViewOutterMargin
            height  += CGFloat(row) * WBStatusPictureItemWidth
            height  += CGFloat(row - 1) * WBStatusPictureViewInnerMargin
        
        
        return CGSize(width: WBStatusPictureItemWidth, height: height)
    }
    

    
    /// 给定一个数字 返回对应的描述结果
    ///
    /// - Parameters:
    ///   - count: 数字
    ///   - defautStr: 默认标题
    /// - Returns:  描述结果
    private func countString(count:Int,defautStr:String) -> String{
        
        if count == 0 {
            return defautStr
        }
        
        if count < 10000 {
            return count.description
        }
        
        return String(format:"%0.2f万",Double(count/10000))
    }
    
}
