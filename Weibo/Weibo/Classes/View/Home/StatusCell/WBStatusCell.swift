//
//  WBStatusCell.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/8.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBStatusCell: UITableViewCell {

    //微博视图模型
    var viewModel:WBSatuesViewModel?{
        
        didSet{
            //设置微博文本
            statusLabel?.text = viewModel?.status.text
            nameLabel.text = viewModel?.status.user?.screen_name
            
            //设置会员图标  直接获取属性 不需要计算
            memberIconView.image = viewModel?.memberIcon
            
            //认证图标
            vipIconView.image = viewModel?.vipIcon
            
            //用户头像
            iconView.cz_setImage(urlString: viewModel?.status.user?.profile_image_url, placeholderImage: UIImage(named: "avatar_default"),isAvatar:true)
            
            //底部工具栏
            toolBar.viewModel = viewModel
            
            //配图视图模型
            pictureView.viewModel = viewModel
            
           

            //设置url数据
            
  
//            let cout = viewModel?.status.pic_urls?.count
            //测试四张图像
//            if CGFloat(cout!) > 4  {
//
//                var picUrl = self.viewModel!.status.pic_urls!
//
//                picUrl.removeSubrange((picUrl.startIndex + 4) ..< picUrl.endIndex)
//                pictureView.urls = picUrl
//
//            }else{
//                pictureView.urls = viewModel?.status.pic_urls
//            }
//
            
            //设置配图
//            pictureView.urls = viewModel?.picURLs
          
            retweetedLabel?.text = viewModel?.retweetedText
            
            //设置来源
            sourceLabel.text = viewModel?.status.source
//            sourceLabel.text = viewModel?.sourceStr
        
        }
    }

    //头像
    @IBOutlet weak var iconView: UIImageView!
    //姓名
    @IBOutlet weak var nameLabel: UILabel!
    //会员图标
    @IBOutlet weak var memberIconView: UIImageView!
    //时间
    @IBOutlet weak var timeLabel: UILabel!
    //来源
    @IBOutlet weak var sourceLabel: UILabel!
    //认证图标
    @IBOutlet weak var vipIconView: UIImageView!
    //微博正文
    @IBOutlet weak var statusLabel: UILabel!
    
    //底部工具栏
    @IBOutlet weak var toolBar: WBStatusToolBar!
    
    //配图视图
    @IBOutlet weak var pictureView: WBStatusPictureView!
    
    //原创微博的控件 nomalCellXib没有 这个label控件 因此用可选的  否则会崩溃
    @IBOutlet weak var retweetedLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //离屏渲染 -异步绘制
        self.layer.drawsAsynchronously = true
        
        //栅格化 -异步绘制后 会生成一张独立的图像 cell在屏幕上滚动的时候 本质上滚动的事这张图片
        //cell优化 要尽量减少图层的数量,相当于一层
        //停止滚动之后可以接受监听
        self.layer.shouldRasterize = true
        
        //使用栅格化 必须注意指定分辨率
        
        self.layer.rasterizationScale = UIScreen.main.scale
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
