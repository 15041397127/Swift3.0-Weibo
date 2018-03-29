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
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let buttonsInfo = [["imageName":"tabbar_compose_idea","title":"文字","clsName":"MJComposeController"],["imageName":"tabbar_compose_photo","title":"照片/视频"],["imageName":"tabbar_compose_weibo","title":"长微博"],["imageName":"tabbar_compose_lbs","title":"签到"],["imageName":"tabbar_compose_review","title":"点评"],["imageName":"tabbar_compose_more","title":"更多","actionName":"clickMore"],["imageName":"tabbar_compose_transfer","title":"好友圈"],["imageName":"tabbar_compose_wbcamera","title":"微博相机"],["imageName":"tabbar_compose_music","title":"音乐"],["imageName":"tabbar_compose_shooting","title":"拍摄"]]
    
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

    }
    
//    override func awakeFromNib() {
//        setupUI()
//    }
    
    //MARK:监听方法
    @objc private func clickButton(){
        
        print("点我了")
        
    }
    
    //关闭视图
    @IBAction func close() {
        
        removeFromSuperview()
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
        
        //0.强行更新布局
        layoutIfNeeded()

        //1.向scrollView添加视图
        let rect = scrollView.bounds
        let v = UIView(frame:rect)
        
        //2.向视图添加按钮
        addButtons(v: v, idx: 0)
        
        //3将视图添加到scrollView
        scrollView.addSubview(v)
    
    }
    
    //向v中添加按钮 按钮的数组索引从idx开始
    func addButtons(v:UIView,idx:Int){
        
        //idx开始 添加6个按钮
        let count = 6
        for i in idx..<(idx + count) {
            
            //从数组字典中获取名称和title
           
            if idx > buttonsInfo.count{
                
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
