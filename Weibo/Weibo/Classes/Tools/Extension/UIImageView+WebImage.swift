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
    func cz_setImage(urlString:String?,placeholderImage:UIImage?){
        
        //处理url
        guard let urlString = urlString,
              let url = URL(string: urlString) else{
            
            //设置站位图片
            
            image = placeholderImage
            
            return
        }
        
        //可选项 只是用在swift  oc有的时候用 ! 可以传入nil
        sd_setImage(with: url, placeholderImage: placeholderImage, options: [], progress: nil) { (image, _ , _ , _) in
            
            
        }
        
        
        
    }
    
    
    
}
