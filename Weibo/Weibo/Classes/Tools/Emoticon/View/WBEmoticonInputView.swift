//
//  WBEmoticonInputView.swift
//  表情键盘
//
//  Created by ZhangXu on 2018/4/12.
//  Copyright © 2018年 张旭. All rights reserved.
//

import UIKit
//可重用标识符
private let cellID = "cellID"
//表情输入视图
class WBEmoticonInputView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var toolBar: WBEmoticonToolbar!
    
    //选中表情回调闭包
    private var selectedEmoticonCallBack: ((_ emoticon:WBEmoicon?) -> ())?
    
    class func inputView(selectedEmoticon:@escaping (_ emoticon:WBEmoicon?) -> ()) -> WBEmoticonInputView {
        
        let nib = UINib(nibName: "WBEmoticonInputView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WBEmoticonInputView
        
        //记录闭包
        v.selectedEmoticonCallBack = selectedEmoticon
        return v
    }
    
    override func awakeFromNib() {
        //注册可重用cell
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
//        let nib = UINib(nibName: "WBEmoticonCell", bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: cellID)
        collectionView.register(WBEmoticonCell.self, forCellWithReuseIdentifier: cellID)
        
        //设置工具栏代理
        toolBar.delegate = self
        
    }
    
}

extension WBEmoticonInputView:WBEmoticonToolbarDelegate{
    
    func emoticonToolbarDidSelectedItemIndex(tool: WBEmoticonToolbar, index: Int) {
        //让collectionView发生滚动 滚动到每个分组的第0页
        let indexPath = IndexPath(item: 0, section: index)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        
        //设置选中状态
        toolBar.selectedIndex = index
        
    }
}

extension WBEmoticonInputView:UICollectionViewDataSource{
    
    //分组数量  -返回表情包的数量
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return WBEmoticonManager.shared.packages.count
    }
    
    //返回每个分组中的表情页的数量
    //每一个分组的表情包 表情页面的数量 emoticons 数组 /20 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return WBEmoticonManager.shared.packages[section].numberOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1取cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! WBEmoticonCell
        
        //2设置cell - 传递对应页面的表情数组 前面是表情包的分组 后面是每个页面的个数
        cell.emocticons = WBEmoticonManager.shared.packages[indexPath.section].emoticon(page:indexPath.item)
        //设置代理
        cell.delegate = self
        
        //3 返回cell
        
        return cell
    }
}
//MARK:遵守协议
extension WBEmoticonInputView:WBEmoiconCellDelegate{
    
    /// 选中的表情回掉
    ///
    /// - Parameters:
    ///   - cell: 分页cell
    ///   - em: 选中的表情 删除键为nil
    func emoiconCellDidSelectedEmoticon(cell: WBEmoticonCell, em: WBEmoicon?) {
        //执行闭包回调选中的表情
        selectedEmoticonCallBack?(em)
        
        //添加最近使用的表情
        guard let em = em else {
            return
        }
        //如果当前的collectionView就是最近的分组 不添加最近使用的表情
        let indexPath = collectionView.indexPathsForVisibleItems[0]
        if indexPath.section == 0 {
            return
        }
        WBEmoticonManager.shared.recentEmoticon(em: em)
        //刷新第0组
        var indexSet = IndexSet()
        indexSet.insert(0)
        collectionView.reloadSections(indexSet)
    }
    
}
