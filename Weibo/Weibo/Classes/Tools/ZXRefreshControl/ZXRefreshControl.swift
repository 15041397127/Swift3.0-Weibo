//
//  ZXRefreshControl.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/21.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//刷新控件
class ZXRefreshControl: UIControl {

    //MARK:属性
    //刷新控件视图的父视图 下拉刷新控件应该试用与 Uitableview  uicollctionview
    private weak var scrollView:UIScrollView?
    
    
    //MARK:构造函数
    init() {
        
        super.init(frame: CGRect())
       
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         //xib也可以使用
        setupUI()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        
        /*
         willMove :addSubView 方法会调用
         - 当添加到父视图的时候 newSuperview是父视图
         - 当父视图被移除 newSuperview为nil
       */
        super.willMove(toSuperview: newSuperview)
        
        //判断父视图的类型
        guard let sv = newSuperview as? UIScrollView else {
            
            return;
        }
      
        scrollView = sv
        
        //KVO监听父视图 contentOffset  KVO要监听的对象负责添加监听者
        //在程序中,只监听某一个对象的某几个属性 如果属性太多 方法会很乱
        scrollView?.addObserver(self, forKeyPath: "contentOffset", options: [], context: nil)
        
        
    }
    
    //本视图从父视图移除
    //提示 所有的下拉刷新框架都是监听父视图的contentOffset
    //所有框架的KVO监听实现思路都是这个
    override func removeFromSuperview() {
        //superView还存在
        
        superview?.removeObserver(self, forKeyPath: "contentOffset")
        
        super .removeFromSuperview()
        
        //superView不存在
        
    }
    
    
    //所有KVO 会调用此方法
    //观察者模式 在不需要的时候都需要释放
    //1.通知中心 如果不释放 什么也不会发生 但是会内存泄露 会多次注册的可能
    //2.kvo会崩溃
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //contentOffset 的y值 跟contentInset 的top有关
        guard let sv = scrollView else {
            
            return
        }
//        sv.contentInset.top = 88;
        //初始化高度为0
        let height = -(sv.contentInset.top + sv.contentOffset.y)
        
        //可以根据高度设置刷新控件的frame
        
        self.frame = CGRect(x: 0, y: -height, width: sv.bounds.width, height: height)
        
        print(sv.contentInset.top)
          print(sv.contentOffset.y)
        print(height)
    }
    
    func beginRefreshing() {
    
        print("开始刷新")
    }
    
    func endRefreshing() {
        print("结束刷新")
    }


}

extension ZXRefreshControl{
    
    
    private func setupUI(){
        
        backgroundColor =  UIColor.orange
    }
    
    
}
