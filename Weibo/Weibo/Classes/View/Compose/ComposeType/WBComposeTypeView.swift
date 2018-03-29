//
//  WBComposeTypeView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/29.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//撰写微博类型视图
class WBComposeTypeView: UIView {

//    override init(frame: CGRect) {
//        super.init(frame: UIScreen.main.bounds)
//
//        backgroundColor = UIColor.cz_random()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    class func composeTypeView() -> WBComposeTypeView{
        
        let nib = UINib(nibName: "WBComposeTypeView", bundle: nil)
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WBComposeTypeView
        
        //XIB 加载默认是 600 * 600
        v.frame = UIScreen.main.bounds
        
        return v
    }

      //显示当前视图
    func show(){
        
        //1 > 将当前视图添加到 根视图控制器
        guard  let vc = UIApplication.shared.keyWindow?.rootViewController else{
            
            return
        }
        //2.添加视图
        vc.view.addSubview(self)

    }
    
    override func awakeFromNib() {
        setupUI()
    }
    
    //MARK:监听方法
    @objc private func clickButton(){
        
        print("点我了")
        
    }
    
    
 
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//private 让extension都是私有
private extension WBComposeTypeView{
    
    func setupUI()  {
        
        //1.创建类型按钮
        let btn = WBComposeTypeButton.composeTypeButton(imageName: "tabbar_compose_music", title: "试一试")
//        btn.center = center
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addSubview(btn)
        
        //2.添加监听方法
        btn.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
}
