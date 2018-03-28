//
//  ZXMeiTuanRefreshView.swift
//  Weibo
//
//  Created by 张旭 on 2018/3/28.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class ZXMeiTuanRefreshView: CZRefreshView {

    @IBOutlet weak var buildingIconView: UIImageView!//提示图标
    @IBOutlet weak var refresh_earthIconView: UIImageView!//提示图标
    @IBOutlet weak var loadingIconView: UIImageView!//提示图标
    
    //俯视图高度
    override var parentViewHeight :CGFloat{
        didSet{
            
            //35- 133
            //0.2 - 1
            if parentViewHeight < 35 {
                return
            }
            
            //高度差 / 最大高度差
            // 35 == 0.2
            //133 == 1
            var scale:CGFloat
            if parentViewHeight >  133 {
                scale = 1
            }else{
                
                scale = 1 - ((133 - parentViewHeight) / (133 - 35))
            }

             loadingIconView.transform = CGAffineTransform(scaleX: scale, y: scale)
            
        }
    }
    
    override func awakeFromNib() {
        
        //1.房子
        let bImage1 = #imageLiteral(resourceName: "takeout_img_refresh_building_1")
        let bImage2 = #imageLiteral(resourceName: "takeout_img_refresh_building_2")
        
        buildingIconView.image = UIImage.animatedImage(with: [bImage1,bImage2], duration: 0.5)
        
        //地球
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = -2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 3
        
        anim.isRemovedOnCompletion = false
        
        refresh_earthIconView.layer.add(anim, forKey: nil)
        
        //3.袋鼠
        
        let kImage1 = #imageLiteral(resourceName: "takeout_img_list_loading_pic1")
        let kImage2 = #imageLiteral(resourceName: "takeout_img_list_loading_pic2")
        
        loadingIconView.image = UIImage.animatedImage(with: [kImage1,kImage2], duration: 0.5)
        
        
        
        //设置锚点
        loadingIconView.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        //设置frame 或者center
        let x = self.bounds.width * 0.5
        let y = self.bounds.height - 35
        loadingIconView.center = CGPoint(x: x, y: y)
        
        loadingIconView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
