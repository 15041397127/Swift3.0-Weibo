//
//  WBComposeTextView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/4/10.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//撰写微博的文本视图

class WBComposeTextView: UITextView {

    private lazy var placeholderLabel =  UILabel()
    
    override func awakeFromNib() {
    
         setupUI()
        
    }
    deinit {
        //注销
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func textDidChange(){
        //如果有文本 不显示站位标签 否则不显示
        placeholderLabel.isHidden = self.hasText
        
        
    }
    

}

//extension WBComposeTextView:UITextViewDelegate{
//
//    func textViewDidChange(_ textView: UITextView) {
//        print("哈哈哈")
//    }
//
//}
//MARK:表情键盘专属方法
extension WBComposeTextView{
    
    //向文本视图插入表情符号[图文混排] nil表示删除
    func insertEmoticon(em:WBEmoicon?){
        //1.em == nil 是删除按钮
        guard let em = em else {
            //删除文本
            deleteBackward()
            return
            
        }
        //2 emoji字符串
        if let emoji = em.emoji,let textRange = selectedTextRange {
            //UITextRange 仅用在此处
            replace(textRange, withText: emoji)
            return
        }
        //代码执行到此 都是图片表情
        //获取表情中的图像属性文本
        //所有的排版系统中 几乎都有一个共同的特点插入的字符显示 跟随前一个字符的属性 但是本身没有属性
        //        let imageText = NSMutableAttributedString(attributedString: em.imageText(font: textView.font!))
        //        //设置图像文字的属性
        //        imageText.addAttributes([NSAttributedStringKey.font : textView.font!], range: NSRange(location: 0, length: 1))
        
        
        let imageText = em.imageText(font: font!)
        
        //1 获取当前textView属性文本 --> 可变的
        let attrStrM = NSMutableAttributedString(attributedString: attributedText)
        //将图像的属性文本 插入到当前的光标位置
        attrStrM.replaceCharacters(in: selectedRange, with: imageText)
        
        //重新设置属性文本
        //记录光标位置
        let range = selectedRange
        //设置文本
        attributedText = attrStrM
        
        //恢复光标位置 length是选中字符的长度 插入文本之后应该为0
        selectedRange = NSRange(location: range.location + 1, length: 0)
        
        //4让代理执行文本变化方法 在需要的时候 通知代理执行协议方法
        delegate?.textViewDidChange?(self)
        
        //5执行当前对象的文本变化方法
        textDidChange()
    }
}


private extension WBComposeTextView{
    
    func setupUI(){
        
        //注册通知  一对多 如果其他控件 监听当前文本视图的通知 不会影响
        //但是使用代理 其他控制 就无法使用代理监听通知
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: self)
        
        
        //设置站位标签
        placeholderLabel.text = "分享新鲜事"
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.frame.origin = CGPoint(x: 5, y: 8)
        placeholderLabel.sizeToFit()
     
        self.addSubview(placeholderLabel)
        
        //测试代理
//        self.delegate = self
    
    }

}
