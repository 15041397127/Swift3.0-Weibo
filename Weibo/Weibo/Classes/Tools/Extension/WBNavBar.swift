//
//  WBNavBar.swift
//  Weibo
//
//  Created by 张旭 on 2018/1/15.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
private var  barHeight:CGFloat?
private var  barY:CGFloat?
class WBNavBar: UINavigationBar {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        for aView in self.subviews {
        if #available(iOS 11.0, *) {
            
             if UIScreen.main.bounds.height == 812 {
                barHeight = 96
                barY = 44
             }else{
                barHeight = self.frame.height
                barY = 20
            }
            if NSStringFromClass(type(of: aView)) == "_UINavigationBarContentView" {

                aView.frame = CGRect(x: 0, y: barY!, width: aView.frame.width, height: aView.frame.height)
         
            }
            else if NSStringFromClass(type(of: aView)) == "_UIBarBackground" {
                
                aView.frame = CGRect(x: 0, y: 0, width: aView.frame.width, height:barHeight!)
            }
        }
     }
  }
}

//
//      //                navigationBar.frame = CGRect(x: 0, y: 44, width: UIScreen.cz_screenWidth(), height: 62)
//                    navigationBar.isTranslucent = false
//                    if UIScreen.main.bounds.height == 812 {
//
//                        navigationBar.frame = CGRect(x: 0, y: 44, width: UIScreen.cz_screenWidth(), height: 62)
//
//                        let view1 = UIView()
//                        view1.frame = CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 44)
//                        view1.backgroundColor = UIColor.cz_color(withHex: 0xF6F6F6)
//                        view .addSubview(view1)
//
//                    }else{
//                        navigationBar.frame = CGRect(x: 0, y: 20, width: UIScreen.cz_screenWidth(), height: 44)
//
//                        let view1 = UIView()
//                        view1.frame = CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 20)
//                        view1.backgroundColor = UIColor.cz_color(withHex: 0xF6F6F6)
//
//                        view .addSubview(view1)
//
//                    }
//
//                 }else{
//
//                }

/*

for  view  in self.subviews {
    let className =  NSStringFromClass(view.classForCoder)
    
    if className.contains("_UINavigationBarContentView"){
        view.frame = CGRect(x: 0, y: 20, width: UIScreen.cz_screenWidth(), height: 44)
        
    }else if className.contains("_UIBarBackground"){
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64)
    }
}
}
 */





