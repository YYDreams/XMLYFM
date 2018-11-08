//
//  HomeViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/10/31.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView

class HomeViewController: BaseTableViewController {
    
    private lazy var headerView: ListenHeaderView = {
        
        let headerView = ListenHeaderView(frame: CGRect(x: 0, y: 0, width: screenW, height: 100))
        
        headerView.handlerBtnOnClikCallBack = { (index: Int) -> Void in
            print("===========\(index)")
        }
        return headerView
        
    }()
    
    private lazy var viewControllers: [UIViewController] = {
        let oneVc = FMHomeRecommendController()
        let twoVc = FMVipController()
        let threeVc = FMNovelController()
        return [oneVc, twoVc, threeVc]
    }()
    
    private lazy var titles: [String] = {
        
        return ["推荐","VIP", "小说"]
    }()
    
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.isAverage = true
        layout.sliderWidth = 80
        layout.titleViewBgColor = UIColor.white
        layout.titleColor = UIColor(r: 178, g: 178, b: 178)
        layout.titleSelectColor = UIColor(r: 16, g: 16, b: 16)
        
        layout.bottomLineColor = UIColor.red
        layout.sliderHeight = 50
        layout.isHovered = false
        layout.titleFont = UIFont.systemFont(ofSize: 15)
        return layout
    }()
    
    
    private lazy var advancedManager: LTAdvancedManager = {
        
        
        let advancedManager = LTAdvancedManager(frame: CGRect(x: 0, y:0, width: screenW, height: screenH), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout, headerViewHandle: {[weak self] in
            guard let strongSelf = self else { return UIView() }
//            let headerView = strongSelf.headerView
            return headerView
            
        })
        return advancedManager
        
    }()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(advancedManager)
//        navigationController?.navigationBar.insertSubview(advancedManager, at: 0)
//        navigationController?.navigationBar.insertSubview(tipLabel, at: 0)
//        navigationController?.tabBarItem.addSubview(advancedManager)
        
    }
    
}


