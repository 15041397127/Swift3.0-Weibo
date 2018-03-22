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
        
        //KVO监听父视图 contentOffset
        scrollView?.addObserver(self, forKeyPath: "contentOffset", options: [], context: nil)
        
        
    }
    
    //所有KVO 会调用此方法
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
