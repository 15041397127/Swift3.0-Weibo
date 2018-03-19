//
//  WBStatusPictureView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/14.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBStatusPictureView: UIView {

    var viewModel:WBSatuesViewModel?{
        
        didSet{
            
            calcViewSize()
            
        }

    }
    
    //根据视图模型的配图大小 调整显示内容
    private func calcViewSize(){
        
        //修改配图视图的高度
        heightCons.constant =  viewModel?.pictureViewSize.height ?? 0
    }
    
    
    //配图视图的数组
    var urls:[WBStatusPicture]?{
        didSet{
            //1.隐藏所有的imageView
            
            for v  in subviews {
                v.isHidden = true
            }
            
            //2.遍历urls数组 顺序设置图像
            var index = 0
            for  url  in urls ?? [] {
                //获得对象索引的 imageView
                let iv = subviews[index] as! UIImageView
                
                //判断四张图像
                if index == 1 && urls?.count == 4 {
                    
                    index += 1
                    
                }
                
                
                
                //设置图像
               iv.cz_setImage(urlString: url.thumbnail_pic, placeholderImage: nil)
                
               //显示图像
                iv.isHidden = false
                
                index += 1
                
            }
            
            
        }
    }
    
    @IBOutlet weak var heightCons: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
        setupUI()
        
    }
    
    
}

//MARK: - 设置页面
extension WBStatusPictureView{
    //cell中所有的空间都是提前准备好
    //设置的时候根据数据是否显示
    //不要动态创建控件
    private func setupUI(){
     
        //设置背景颜色
        backgroundColor = superview?.backgroundColor
        
        //超出边界的内容不显示
        clipsToBounds = true
        
        //循环创建 9个imgeView
        let count = 3
        let rect = CGRect(x: 0, y: WBStatusPictureViewOutterMargin, width: WBStatusPictureItemWidth, height: WBStatusPictureItemWidth)
        
        for i in 0..<count * count {
            
            let iv = UIImageView()
            
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true

            //行
            let row = CGFloat (i/count)
            //列
            let col = CGFloat (i%count)
            
            let xOffset = col * (WBStatusPictureItemWidth + WBStatusPictureViewInnerMargin)
            let yOffset = row * (WBStatusPictureItemWidth + WBStatusPictureViewInnerMargin)
            
            iv.frame = rect.offsetBy(dx:xOffset , dy: yOffset)
            addSubview(iv)
        
        }
    }
}
