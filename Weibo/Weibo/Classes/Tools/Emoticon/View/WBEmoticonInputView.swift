//
//  WBEmoticonInputView.swift
//  表情键盘
//
//  Created by ZhangXu on 2018/4/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//可重用标识符
private let cellID = "cellID"
//表情输入视图
class WBEmoticonInputView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var toolBar: UIView!
    class func inputView() -> WBEmoticonInputView {
        
        let nib = UINib(nibName: "WBEmoticonInputView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WBEmoticonInputView
        
        return v
    }
    
    override func awakeFromNib() {
        //注册可重用cell
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
//        let nib = UINib(nibName: "WBEmoticonCell", bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: cellID)
        collectionView.register(WBEmoticonCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
}

extension WBEmoticonInputView:UICollectionViewDataSource{
    
    //分组数量  -返回表情包的数量
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return WBEmoticonManager.shared.packages.count
    }
    
    //返回每个分组中的表情页的数量
    //每一个分组的表情包 表情页面的数量 emoticons 数组 /20 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return WBEmoticonManager.shared.packages[section].numberOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1取cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! WBEmoticonCell
        
        //2设置cell
//        cell.label.text = "\(indexPath.section) ~~\(indexPath.item)"
    
        
        //3 返回cell
        
        return cell
    }
}
