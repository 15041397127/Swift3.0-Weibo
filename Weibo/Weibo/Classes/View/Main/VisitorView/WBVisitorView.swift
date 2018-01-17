//
//  WBVisitorView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/1/15.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit

//访客视图
class WBVisitorView: UIView {
   
    //访客视图的信息字典  [imageName / message]
    //提示:如果是首页 imageName == ""
    var visitorInfo:[String:String]?{
        
        didSet{
            //1.去字典信息
            guard let imageName = visitorInfo?["imageName"],
                let message = visitorInfo?["message"] else{
                    return
            }
            
            //2.设置消息
            tipLabel.text = message
            
            //3.设置图像,首页不需要设置
            if imageName == "" {
                startAnimation()
                return
            }
            
            iconView.image = UIImage(named:imageName)
            //其他访客视图不需要显示小房子和遮罩
            houseIconView.isHidden = true
            maskIconView.isHidden = true
            
        }
    }
    
    //MARK:构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //旋转图标
    private func startAnimation(){
        
        let anim = CABasicAnimation(keyPath:"transform.rotation")
        
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 15
       
        //动画完成不删除,如果iconView被释放 动画会一起销毁
        //在设置连续播放的动画非常有用!
        
        anim.isRemovedOnCompletion = false
        
        //将动画添加到图层
        iconView.layer.add(anim, forKey: nil)
        
    }
    
    
    //MARK:-设置访客视图信息
    /// 使用字典设置访客视图的信息
    ///
    /// - Parameter dict: [imageName / message]
    //提示:如果是首页 imageName == ""
    func  setupInfo(dict:[String:String]){
        
        //在上面已经优化
        
        
    }
    
    
    //MARK:添加私有控件
    //懒加载属性只有调用 UIKit 控件的指定的构造函数,其他都需要使用类型
    //图像视图
    private lazy var iconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_smallicon"))
    
    //遮罩图片
    private lazy var maskIconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_mask_smallicon"))
    
    
    //小房子
    private lazy var houseIconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_house"))
    
    //提示标签
    private lazy var tipLabel:UILabel = UILabel.cz_label(withText: "关注一些人,回这里看看有什么惊喜", fontSize: 14, color: UIColor.darkGray)
    
    //注册按钮
    private lazy var registerButton:UIButton = UIButton.cz_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    //登陆按钮
    private lazy var loginButton:UIButton = UIButton.cz_textButton("登录", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    

}

//MARK:设置页面
extension WBVisitorView {
    
    func setupUI(){
        
        self.backgroundColor = UIColor.cz_color(withHex: 0xEDEDED)
        //1.添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseIconView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        //文本居中
        tipLabel.textAlignment = .center
        
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        let margin:CGFloat = 20
        //2.取消autoresing
        addConstraint(NSLayoutConstraint.init(item: iconView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))//中心x
        addConstraint(NSLayoutConstraint.init(item: iconView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: -60))
        //小房子
        addConstraint(NSLayoutConstraint.init(item: houseIconView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))//中心x
        addConstraint(NSLayoutConstraint.init(item: houseIconView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 0))
        
        //提示标签
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 236))
        
        //注册
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .left,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 100))
        
        
        //登录
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .right,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: registerButton,
                                              attribute: .width,
                                              multiplier: 1.0,
                                              constant: 0))
        //遮罩图像
        //views:定义VFL中控件名称和实际名称映射关系
        //metrics:定义VFL () 指定的常数映射关系
        let viewDict = ["maskIconView":maskIconView,
                        "registerButton":registerButton] as [String : Any]
        let metrics = ["spaceing":-20]
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[maskIconView]-0-|",
            options: [],
            metrics: nil,
            views: viewDict))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[maskIconView]-(spaceing)-[registerButton]",
            options: [],
            metrics: metrics,
            views: viewDict))
        
    }

}
