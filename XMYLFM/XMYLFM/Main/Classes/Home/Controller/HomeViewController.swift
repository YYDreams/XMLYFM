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
    
    private lazy var headerView: UIView = UIView()
    
    private lazy var viewControllers: [UIViewController] = {
        let oneVc = FMHomeRecommendController()
        let twoVc = FMVipController()
        let threeVc = FMNovelController()
        let fourVc = UIViewController()
        let fiveVc = UIViewController()
        let sixVc = UIViewController()
        let sevenVc = UIViewController()
        let eightVc = UIViewController()
        let nineVc = UIViewController()
        let tenVc = UIViewController()
        let elevenVc = UIViewController()
        let twelveVc = UIViewController()
        
        return [oneVc, twoVc, threeVc,fourVc,fiveVc,sixVc,sevenVc,eightVc,nineVc,tenVc,elevenVc,twelveVc]
    }()
    
    private lazy var titles: [String] = {
        
        return ["推荐","VIP", "小说","直播","儿童","广播","精品","相声","人文","历史","段子","音乐"]
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.titleViewBgColor = UIColor.white
        layout.titleColor = UIColor(r: 178, g: 178, b: 178)
        layout.titleSelectColor = UIColor(r: 16, g: 16, b: 16)
        
        layout.bottomLineColor = UIColor.red
        layout.sliderHeight = 40
        layout.isHovered = false
        layout.titleFont = UIFont.systemFont(ofSize: 15)
        return layout
    }()
    
    
    private lazy var advancedManager: LTAdvancedManager = {
        let advancedManager = LTAdvancedManager(frame: CGRect(x: 0, y:statusBarHeight, width: screenW, height: screenH ), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout, headerViewHandle: {[weak self] in
            guard let strongSelf = self else { return UIView() }
            let headerView = strongSelf.headerView
            return headerView
            
        })
        return advancedManager
        
    }()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(advancedManager)

        
    }
    
}


