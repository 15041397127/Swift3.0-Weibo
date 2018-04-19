//
//  WBEmoticonCell.swift
//  表情键盘
//
//  Created by ZhangXu on 2018/4/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//表情cell的协议
@objc protocol WBEmoiconCellDelegate:NSObjectProtocol{
    
    /// 表情cell 选中表情模型
    ///
    /// - Parameter em: 表情模型 nil表示删除
    func emoiconCellDidSelectedEmoticon(cell:WBEmoticonCell, em:WBEmoicon?)
}

//表情的页面cell  每一个页面显示20个表情  每个cell与collectionView一样大小
//每一个cell用九宫格算法 自行添加20个表情 和一个删除按钮
class WBEmoticonCell: UICollectionViewCell {
    
    //代理
    weak var delegate:WBEmoiconCellDelegate?
    
    //当前页面表情模型数组 最多20个
    var emocticons:[WBEmoicon]?{
        didSet{
            //隐藏所有的按钮
            for v  in contentView.subviews {
                v.isHidden = true
            }
            //显示删除按钮
            contentView.subviews.last?.isHidden = false
            
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
    
    
    
    //MARK:监听方法
    ///
    /// - Parameter button: 选中表情按钮
    @objc private func selectEmoticonButton(button:UIButton){
         //取tag 0 -20 20是对应的删除按钮
        let tag = button.tag
        //根据tag 判断是否是删除按钮 如果不是删除按钮 取得表情
        var em:WBEmoicon?
        if tag < (emocticons?.count)! {
            em = emocticons?[tag]
        }
       //em 要么是选中的模型 如果为nil 对应的是删除按钮
        delegate?.emoiconCellDidSelectedEmoticon(cell: self, em: em)
        
    }
    
//    override func awakeFromNib() {
//        steupUI()
//    }
    //长按手势识别 是一个非常重要的手势
    //而且可以保证一个对象监听两种点击的手势 而且不需要考虑手势冲突
    @objc private func longGesture(gesture:UILongPressGestureRecognizer){
        
        
    }
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
            
            //设置按钮的tag
            btn.tag = i
            btn.addTarget(self, action: #selector(selectEmoticonButton), for: .touchUpInside)
            
        }
        //取出末尾的按钮
        let removeButton = contentView.subviews.last as! UIButton
        //设置图像
        let image = UIImage(named: "compose_emotion_delete_highlighted", in: WBEmoticonManager.shared.bundle, compatibleWith: nil)
        removeButton.setImage(image, for: [])
        
        //添加长按手势
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longGesture))
        longPress.minimumPressDuration = 0.1
        addGestureRecognizer(longPress)
        
    }
}
