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
        //在此方法中 collectionView大小以及确定
        
        guard let collectionView = collectionView else {
            return
        }
        
        itemSize = collectionView.bounds.size
//        minimumLineSpacing = 0//行间距
//        minimumInteritemSpacing = 0//格子间距
        //上面两行以及在在xib中设置
        //设定滚动方法
        //水平方向滚动  cell是垂直方向布局
        //垂直方向滚动  cell是水平方向布局
        scrollDirection = .horizontal
        
    }

}
