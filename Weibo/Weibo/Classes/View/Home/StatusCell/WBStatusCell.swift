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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
