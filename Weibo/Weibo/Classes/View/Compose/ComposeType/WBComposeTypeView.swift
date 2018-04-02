//
//  WBComposeTypeView.swift
//  Weibo
//
//  Created by ZhangXu on 2018/3/29.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
import pop
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
    @IBOutlet weak var scrollView: UIScrollView!
    
    //关闭按钮约束
    @IBOutlet weak var closeButtonCenterXCons: NSLayoutConstraint!
    //返回前一页按钮约束
    @IBOutlet weak var returnButtonCenterXCons: NSLayoutConstraint!
    //返回前一页按钮
    @IBOutlet weak var returnBtn: UIButton!
    private let buttonsInfo = [["imageName":"tabbar_compose_idea","title":"文字","clsName":"WBComposeViewController"],["imageName":"tabbar_compose_photo","title":"照片/视频"],["imageName":"tabbar_compose_weibo","title":"长微博"],["imageName":"tabbar_compose_lbs","title":"签到"],["imageName":"tabbar_compose_review","title":"点评"],["imageName":"tabbar_compose_more","title":"更多","actionName":"clickMore"],["imageName":"tabbar_compose_transfer","title":"好友圈"],["imageName":"tabbar_compose_wbcamera","title":"微博相机"],["imageName":"tabbar_compose_music","title":"音乐"],["imageName":"tabbar_compose_shooting","title":"拍摄"]]
    
    class func composeTypeView() -> WBComposeTypeView{
        
        let nib = UINib(nibName: "WBComposeTypeView", bundle: nil)
        
        //从XIB加载完成视图 会调用 awakeFromNib
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WBComposeTypeView
        
        //XIB 加载默认是 600 * 600
        v.frame = UIScreen.main.bounds
        
        v.setupUI()
        
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
        
        //3.开始动画
        showCurrentView()

    }
    
//    override func awakeFromNib() {
//        setupUI()
//    }
    
    //MARK:监听方法
    @objc private func clickButton(button:WBComposeTypeButton){
        
        print("点我了")
        
        //1判断当前显示的视图
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        let v = scrollView.subviews[page]
        
        //2.遍历当前视图
        //选中的按钮放大 未选中的按钮缩小
        for (i,btn) in v.subviews.enumerated() {
            
            //缩放动画
            let scaleAnim:POPBasicAnimation = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
            
            //x,y在系统中使用 cgpoint 表示 如果要转换成id 需要使用 NSValue包装
            let scale = (button == btn) ? 2 : 0.2
            let value = NSValue(cgPoint: CGPoint(x: scale, y: scale))
            scaleAnim.toValue = value
            scaleAnim.duration = 0.5
            
            btn.pop_add(scaleAnim, forKey: nil)
            
            //渐变动画 - 动画组
            let alphaAnim:POPBasicAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
            alphaAnim.toValue = 0.2
            alphaAnim.duration = 0.5
            
            btn.pop_add(alphaAnim, forKey: nil)
            
            //3监听动画完成
            
            if i == 0{
                alphaAnim.completionBlock = {_,_ in
                    
                    //执行回调
                    
                    
                }

            }
        }
    }
    
    //点击更多按钮
    @objc private func clickMore(){
        
        //将scrollView滚动到第二页
        scrollView.setContentOffset(CGPoint(x:scrollView.bounds.width,y:0), animated: true)
        
        //底部按钮 让两个按钮分开
        returnBtn.isHidden = false
        
        //两边的间距
        let margin = scrollView.bounds.width / 6
        
        closeButtonCenterXCons.constant += margin
        returnButtonCenterXCons.constant -= margin
        
        UIView.animate(withDuration: 0.25) {
            
            self.layoutIfNeeded()
        }
        
    }
    
    //返回按钮
    @IBAction func clickReturn() {
       
        scrollView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        
        closeButtonCenterXCons.constant = 0
        returnButtonCenterXCons.constant = 0
    
        UIView.animate(withDuration: 0.25, animations: {
            self.layoutIfNeeded()
            self.returnBtn.alpha = 0
        }) { (_) in
            self.returnBtn.isHidden = true
            self.returnBtn.alpha = 1
        }
        
    }
    //关闭视图
    @IBAction func close() {
        
//        removeFromSuperview()
        hideButtons()
    }
    
    
 
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//微博动画方法扩展
private extension WBComposeTypeView{
    
    //显示当前动画
    private func showCurrentView(){
        
        //1 创建动画
        let anim:POPBasicAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        anim.fromValue = 0
        anim.toValue = 1
        anim.duration = 0.25
        //2.添加到视图
        pop_add(anim, forKey: nil)

        //添加按钮的动画
        showButtons()
    }
    
    //弹力显示所有的按钮
    private func showButtons(){
        
        //MARK:显示部分的动画
        //1.获取scorllview子视图的第0个视图
        let v = scrollView.subviews[0]
        
        //2.遍历v中的所有的按钮
        for (i,btn) in v.subviews.enumerated() {
            
            //创建动画
            let anim:POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
            
            //设置动画属性
            anim.fromValue = btn.center.y + 350
            anim.toValue = btn.center.y
            anim.springBounciness = 8//弹力系数 默认4 数值越大 速度越快 0-20
            anim.springSpeed = 8//弹力系数 默认12 数值越大 速度越快 0-20
            
            //设置动画启动时间
            anim.beginTime = CACurrentMediaTime() + CFTimeInterval(i) * 0.025
            
            //添加动画
            btn.pop_add(anim, forKey: nil)
            
        }
    }
    
    //MARK:隐藏动画
    private func hideButtons(){
        
        //1.根据contentOffset 判断当前的子视图
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        let v = scrollView.subviews[page]
        
        //遍历v中的所有按钮
        for (i,btn)  in v.subviews.enumerated().reversed() {
            
            //1.创建
            let anim:POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
            
            //动画属性
            anim.fromValue = btn.center.y
            anim.toValue = btn.center.y + 350
            
            anim.beginTime = CACurrentMediaTime() + CFTimeInterval(v.subviews.count - i) * 0.025
            
            btn.layer.pop_add(anim, forKey: nil)
            
            //4 监听最后一个按钮动画 是第零个
            if i == 0{
                
                anim.completionBlock = { (_,_) -> () in
                    self.hidCurrentView()
                    
                }
            }
        }
 
    }
        //隐藏当前视图 - 开始时间
    private func hidCurrentView(){
        //创建动画
        let anim:POPBasicAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        anim.fromValue = 1
        anim.toValue = 0
        anim.duration = 0.25
        
        pop_add(anim, forKey: nil)
        
        //添加完成监听方法
        anim.completionBlock = { _,_ in

            self.removeFromSuperview()
            
        }
    }
}
//private 让extension都是私有
private extension WBComposeTypeView{
    
    func setupUI()  {
        
        //0.强行更新布局
        layoutIfNeeded()

        //1.向scrollView添加视图
        
        let width = scrollView.bounds.width
        let rect = scrollView.bounds
        
        for i  in 0..<2 {
             let v = UIView(frame:rect.offsetBy(dx: CGFloat(i) * width, dy: 0))
            //        //2.向视图添加按钮
             addButtons(v: v, idx: i * 6)
            //        //3将视图添加到scrollView
             scrollView.addSubview(v)
        }

        //4. 设置scorllView
        scrollView.contentSize = CGSize(width: 2 * width, height: 0)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        
        //禁用滚动
        scrollView.isScrollEnabled = false
    }
    
    //向v中添加按钮 按钮的数组索引从idx开始
    func addButtons(v:UIView,idx:Int){
        
        //idx开始 添加6个按钮
        let count = 6
        for i in idx..<(idx + count) {
            
            //从数组字典中获取名称和title
           
            if i >= buttonsInfo.count{
                
                break
            }
            
            let dict = buttonsInfo[i]
            
          guard  let imageName = dict["imageName"],
            let title = dict["title"] else{
                continue
            }
            
            
            //1.创建按钮
            let bt = WBComposeTypeButton.composeTypeButton(imageName: imageName, title: title)
            
            //将btn添加大视图
            
            v.addSubview(bt)
            
            //添加监听方法
            if let actionName = dict["actionName"]{
                //OC中 NSSelectorFromString(@"")
                bt.addTarget(self, action: Selector(actionName), for: .touchUpInside)
                
            }else{
                
                bt.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
                
            }
            
            //设置要展现的类名 不需要任何的判断
            bt.clsName = dict["clsName"]
            
        }
        
        //布局按钮
        
        //视图索引
        //准备常量
        let btnSize = CGSize(width: 100, height: 100)
        let margin = (v.bounds.width - 3 * btnSize.width)/4
        for (i,btn) in v.subviews.enumerated() {
            
            let y:CGFloat = (i > 2) ? (v.bounds.height - btnSize.height) : 0
            
            let col = i % 3
            
            let x =  CGFloat(col + 1) * margin + CGFloat(col) * btnSize.width
            
            btn.frame = CGRect(x: x, y: y, width: btnSize.width, height: btnSize.height)
        }
  
    }
}
