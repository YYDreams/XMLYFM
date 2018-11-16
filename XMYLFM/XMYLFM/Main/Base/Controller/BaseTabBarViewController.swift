//
//  BaseTabBarViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/10/31.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    private lazy var playBtn: UIButton = UIButton.init(imageName: "tab_play", bgImageName: "tab_play")
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        setupPlayBtn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        
        setupViewControllers()
    }
}

extension BaseTabBarViewController{
    
    private func setupViewControllers(){
        
        
        let controllers:[UIViewController]  =
            [HomeViewController(),ListenViewController(),PlayViewController(),DiscoverViewController(),MineViewController()]
        let normalImageNames = ["home","find","","favor","me"]
        let selectImageNames = ["home_1","find_1","","favor_1","me_1"]
        
        let mineTitle = !(LoginHelper.sharedInstance.userInfo?.isLogin ?? false)  ? "未登录" : "账户"
        let titles = ["首页","我听","","发现",mineTitle]
        
        for (index, vc) in controllers.enumerated() {
            
            vc.tabBarItem.title = titles[index]
            vc.tabBarItem.image = UIImage(named: normalImageNames[index])
            vc.tabBarItem.selectedImage = UIImage(named: selectImageNames[index])
            //设置选中图标的颜色
            UITabBar.appearance().tintColor = kThemeColor
            addChildViewController( BaseNavViewController(rootViewController: vc))
            
        }
        
    }
    private func setupAppearance(){
        
        let tabBar = UITabBarItem.appearance()
        let attrs_Normal = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.gray]
        let attrs_Select = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: kThemeColor]

        tabBar.setTitleTextAttributes(attrs_Normal, for: .normal)
        tabBar.setTitleTextAttributes(attrs_Select, for: .selected)
    }
    
    private func setupPlayBtn(){
        
        tabBar.addSubview(playBtn)
        let w = tabBar.bounds.width / CGFloat(childViewControllers.count) - 1
        // OC CGRectInset 正数向内索进 负数向外扩展 例如 中心向上凸出 -20
        //        composeBtn.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: -20)
        playBtn.frame = tabBar.bounds.insetBy(dx: 2 * w , dy: 0)
        playBtn.addTarget(self, action: #selector(playBtnOnClick), for: .touchUpInside)
        
    }
    @objc  private func  playBtnOnClick(){
        
        print("playBtnOnClick")
        present(BaseNavViewController(rootViewController: PlayViewController()), animated: true, completion: nil)
        
    }
}
