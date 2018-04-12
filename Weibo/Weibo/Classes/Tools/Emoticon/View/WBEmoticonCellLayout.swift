//
//  WBEmoticonCellLayout.swift
//  表情键盘
//
//  Created by ZhangXu on 2018/4/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//表情集合视图的布局
class WBEmoticonCellLayout: UICollectionViewFlowLayout {

    //prepare 就是OC中的prepareLayout
    override func prepare() {
        super.prepare()
        //设定滚动方法
        //水平方向滚动  cell是垂直方向布局
        //垂直方向滚动  cell是水平方向布局
        scrollDirection = .horizontal
        
    }

}
