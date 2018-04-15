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
    
    //当前页面表情模型数组 最多20个
    var emocticons:[WBEmoicon]?{
        didSet{
            //隐藏所有的按钮
            for v  in contentView.subviews {
                v.isHidden = true
            }
            //遍历表情模型数组 设置按钮图像
            for (i,em)   in (emocticons ?? []).enumerated(){
                //取出按钮
            if let btn = contentView.subviews[i] as? UIButton {
                //设置图像 - 如果图像为nil 会清空图像 避免复用
                btn.setImage(em.image, for: [])
                
                //设置emoji的字符串
                btn.setTitle(em.emoji, for: [])
                btn.isHidden = false
            }
   
         }
      }
    }
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
        let leftMargin:CGFloat = 8//左右间距
        let bottomMargin:CGFloat = 16//底部间距 显示pageControl和一些提示
        
        let w = (bounds.width - 2 * leftMargin) / CGFloat(colCount)
        let h = (bounds.height - bottomMargin) / CGFloat(rowCount)
        
      //连续创建21个按钮
        for i in 0..<21 {
            
            let row = i / colCount
            let col = i % colCount
            let btn = UIButton()
            //设置按钮的大小
            let x = leftMargin + CGFloat(col) * w
            let y = CGFloat(row) * h
            btn.frame = CGRect(x:x , y: y, width: w, height: h)
            
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 32)//emoji大小
            contentView.addSubview(btn)
            
        }
    }
}
