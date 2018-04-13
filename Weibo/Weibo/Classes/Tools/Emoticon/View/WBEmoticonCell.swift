//
//  WBEmoticonCell.swift
//  表情键盘
//
//  Created by ZhangXu on 2018/4/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//表情的页面cell  每一个页面显示20个表情  每个cell与collectionView一样大小
//每一个cell用九宫格算法 自行添加20个表情 和一个删除按钮
class WBEmoticonCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
         steupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        steupUI()
//    }
}
private extension WBEmoticonCell{
    //-从 XIB加载 bounds是xib中定义的大小 不是size的大小
    //从纯代码创建 bounds就是布局属性中设置的itemSize
    func steupUI(){
        
        let rowCount = 3//总行
        let colCount = 7//总列
        
      //连续创建21个按钮
        for i in 0..<21 {
            
            let row = i/colCount
            let col = i%rowCount
            let btn = UIButton()
            btn.backgroundColor = UIColor.red
            contentView.addSubview(btn)
            
        }
    }
}
