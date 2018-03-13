//
//  WBStatusToolBar.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/13.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

class WBStatusToolBar: UIView {

    var viewModel:WBSatuesViewModel?{
    
        didSet{
            
            retweetedButton.setTitle("\(viewModel?.status.reposts_count)", for: .normal)
            commenButton.setTitle("\(viewModel?.status.comments_count)", for: .normal)
            commenButton.setTitle("\(viewModel?.status.attitudes_count)", for: .normal)
        }
    }
    
    
    //转发
    @IBOutlet weak var retweetedButton: UIButton!
    //评论
    @IBOutlet weak var commenButton: UIButton!
    //点赞
    @IBOutlet weak var likeButton: UIButton!
    
    
    

}
