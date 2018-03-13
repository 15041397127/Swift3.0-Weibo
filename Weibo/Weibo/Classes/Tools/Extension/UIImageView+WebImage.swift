//
//  UIImageView+WebImage.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/13.
//  Copyright © 2018年 张旭. All rights reserved.
//

import SDWebImage

extension UIImageView {
    
    
    /// 隔离SDWebImage 设置图像函数
    ///
    /// - Parameters:
    ///   - urlString: urlString
    ///   - placeholderImage: 展位图
    ///   - isAvatar:是否头像
    func cz_setImage(urlString:String?,placeholderImage:UIImage?,isAvatar:Bool = false){
        
        //处理url
        guard let urlString = urlString,
              let url = URL(string: urlString) else{
            
            //设置站位图片
            
            image = placeholderImage
            
            return
        }
        
        //可选项 只是用在swift  oc有的时候用 ! 可以传入nil
        sd_setImage(with: url, placeholderImage: placeholderImage, options: [], progress: nil) { [weak self] (image, _ , _ , _) in
            
            //完成回调 - 判断是否是头像
            
            if isAvatar {
                
                self?.image = image?.cz_avatarImage(size: self?.bounds.size)
 
            }
  
        }
 
    }

}
