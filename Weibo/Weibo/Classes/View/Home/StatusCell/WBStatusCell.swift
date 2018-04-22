//
//  WBStatusCell.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/8.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//微博celld的协议
//协议需要设置可选方法
//需要@objc @objc optional
//遵守NSObjectProtocol
@objc protocol  WBStatusCellDelegate:NSObjectProtocol{
    
    //微博cell选择的URL字符串
    @objc optional func statusCellDidSelectedURLString(cell:WBStatusCell,urlString:String)
    
}

class WBStatusCell: UITableViewCell {
    //代理属性
    weak var delegate:WBStatusCellDelegate?

    //微博视图模型
    var viewModel:WBSatuesViewModel?{
        
        didSet{
            //设置微博文本
            statusLabel?.attributedText = viewModel?.statusAttrText
            retweetedLabel?.attributedText = viewModel?.retweetedAttrText
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
          
          
            
            //设置来源
            sourceLabel.text = viewModel?.status.source
//            sourceLabel.text = viewModel?.sourceStr
            
            //设置时间
            timeLabel.text = viewModel?.status.createdDate?.description
        
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
    @IBOutlet weak var statusLabel: FFLabel!
    
    //底部工具栏
    @IBOutlet weak var toolBar: WBStatusToolBar!
    
    //配图视图
    @IBOutlet weak var pictureView: WBStatusPictureView!
    
    //原创微博的控件 nomalCellXib没有 这个label控件 因此用可选的  否则会崩溃
    @IBOutlet weak var retweetedLabel: FFLabel?
    
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
        
        //设置微博文本代理
        statusLabel.delegate = self
        retweetedLabel?.delegate = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension WBStatusCell:FFLabelDelegate{
    
    func labelDidSelectedLinkText(_ label: FFLabel, text: String) {
        
        //判断是否是url]
        if !text.hasPrefix("http://") {
            return
        }
        
        
        //插入? 如果代理没有实现协议方法 就什么都不做
        //使用!  代理没有实现协议方法 任然强行执行 会崩溃
        delegate?.statusCellDidSelectedURLString?(cell: self, urlString: text)
    }

}
