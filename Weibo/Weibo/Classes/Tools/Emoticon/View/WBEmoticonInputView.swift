//
//  WBEmoticonInputView.swift
//  表情键盘
//
//  Created by ZhangXu on 2018/4/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//表情输入视图
class WBEmoticonInputView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var toolBar: UIView!
    class func inputView() -> WBEmoticonInputView {
        
        let nib = UINib(nibName: "WBEmoticonInputView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WBEmoticonInputView
        
        return v
    }
}
