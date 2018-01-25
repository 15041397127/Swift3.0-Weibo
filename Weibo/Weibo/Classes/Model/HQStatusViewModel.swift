//
//  HQStatusViewModel.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/8/30.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQStatusViewModel: CustomStringConvertible {
    
    var status: HQStatus
    
    /// 配图视图大小
    var pictureViewSize: CGSize?
    
    init(model: HQStatus) {
        self.status = model
    
    }
    
    var description: String {
        return status.description
    }

}
