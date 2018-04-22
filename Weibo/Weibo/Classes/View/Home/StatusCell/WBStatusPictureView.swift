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
            
            //设置urs
            urls = viewModel?.picURLs
            
        }

    }
    
    //根据视图模型的配图大小 调整显示内容
    private func calcViewSize(){
        
        //处理宽度
        //1单图 subViews[0]
        if viewModel?.picURLs?.count == 1 {
            
            let viewSize = viewModel?.pictureViewSize ?? CGSize()
            
            let v = subviews[0]
            
            v.frame = CGRect(x: 0, y: WBStatusPictureViewOutterMargin, width: viewSize.width, height: viewSize.height - WBStatusPictureViewOutterMargin)

            
        }else{
            
                 //2多图 恢复subView[0]的宽高  还原九宫格
            let v = subviews[0]
            
            v.frame = CGRect(x: 0, y: WBStatusPictureViewOutterMargin, width: WBStatusPictureItemWidth, height: WBStatusPictureItemWidth)
            
            
        }
        
        
        
   
        
        
        //修改配图视图的高度
        heightCons.constant =  viewModel?.pictureViewSize.height ?? 0
    }
    
    
    //配图视图的数组
   private var urls:[WBStatusPicture]?{
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
    
    //MARK:监听方法
    /// @param selectedIndex    选中照片索引
    /// @param urls             浏览照片 URL 字符串数组
    /// @param parentImageViews 父视图的图像视图数组，用户展现和解除转场动画参照
    @objc private func tapImageView(tap:UITapGestureRecognizer){
        
        
        guard let iv = tap.view,
              let picUrls = viewModel?.picURLs  else {
            return
        }
        
        var selectedIndex = iv.tag
        //针对四张图处理
        if picUrls.count == 4 && selectedIndex > 1 {
            
            selectedIndex -= 1
            
        }
        let urls = (picUrls as NSArray) .value(forKey: "largePic") as! [String]
        
        //处理可见的图像视图数组
        var imageViewList = [UIImageView]()
        for iv  in subviews as! [UIImageView] {
            
            if !iv.isHidden {
                imageViewList.append(iv)
            }
        }
        //发送通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBStatusCellBrowserPhotoNotication), object: selectedIndex, userInfo: [WBStatusCellBrowserPhotoSelectedInexKey:selectedIndex,
                                                                                            WBStatusCellBrowserPhotoURlsKey:urls,
                                                                                            WBStatusCellBrowserPhotoImageViewsKey:imageViewList                                                           ])
        
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
            
            //让imageview 能够接受用户交互
            iv.isUserInteractionEnabled = true
            //添加手势识别
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapImageView))
            iv.addGestureRecognizer(tap)
            
            //设置imageview 的tag
            iv.tag = i
        
        }
    }
}
