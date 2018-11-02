//
//  DiscoverViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/10/31.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView

class DiscoverViewController: BaseTableViewController {
    
    //MARK: -  Lazy Methods
    private lazy var squareArr: [DiscoverModel] = [DiscoverModel]()

    private lazy var headerView: DiscoverHeaderView = {
       
        let headerView = DiscoverHeaderView(frame: CGRect(x: 0, y: 0, width: screenW, height: 100))
        
        headerView.backgroundColor = UIColor.yellow
        return headerView
        
    }()
    
    private lazy var viewControllers: [UIViewController] = {
        let oneVc = UIViewController()
        let twoVc = UIViewController()
        let threeVc = UIViewController()
        let thrVc = UIViewController()
        return [oneVc, twoVc, threeVc,thrVc]
    }()
    
    private lazy var titles: [String] = {
        
        return ["关注", "推荐", "圈子","趣配音"]
    }()
    
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.isAverage = true
        layout.sliderWidth = 80
        layout.titleViewBgColor = UIColor.white
        layout.titleColor = UIColor(r: 178, g: 178, b: 178)
        layout.titleSelectColor = UIColor(r: 16, g: 16, b: 16)
        layout.bottomLineColor = UIColor.red
        layout.titleFont = UIFont.systemFont(ofSize: 15)
        return layout
    }()
    
    
    private lazy var advancedManager: LTAdvancedManager = {

        let advancedManager = LTAdvancedManager(frame: CGRect(x: 0, y: 0, width: screenW, height: screenH), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout, headerViewHandle: {[weak self] in
            guard let strongSelf = self else { return UIView() }
            let headerView = strongSelf.headerView
            return headerView
            
        })
        return advancedManager

    }()
 //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNav()
        
        loadDataFormNetwork()
   
        self.view.addSubview(advancedManager)
        
        
    }

}
//MARK: - setupNav
extension DiscoverViewController{
    
    private func setupNav(){
        
        self.title = "发现"
        navigationItem.rightBarButtonItem = UIBarButtonItem.item(imageName: "搜索", target: self, action: #selector(searchOnClick))

    }
    
    @objc  func searchOnClick(){
        
        print("searchOnClick")
        
        
    }

}

//MARK: - loadDataFormNetwork
extension DiscoverViewController{
    
//http://180.153.255.6/discovery-stream-mobile/discoveryPage/wholeContent/tabs/ts-1541140247973?channel=ios-b1&code=43_440000_4403&device=iPhone&version=6.5.24
    private func loadDataFormNetwork(){

        let params = ["channel":"ios-b1",
                      "code":"43_440000_4403",
                      "device":"iPhone",
                      "version":"6.5.24"
        ] as [String: AnyObject]
        
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_6, urlString: kDiscoveryTabsUrl, parameters: params) { (result, error) in
            
            if error != nil {
                return
            }

            guard  let resultDic  = result as? [String : AnyObject] else{
                return
            }
            
       
            let dataDic = resultDic["data"]
            
            guard let resultDataDic = dataDic as? [String : AnyObject] else{
                
                return
            }
           
    
            guard let resultArr =  resultDataDic["square"] as? [[String: AnyObject]] else{
                return
            }
            
            for  square in resultArr{
                
                let squareModel:DiscoverModel  = DiscoverModel.deserialize(from: square)!
                
                self.squareArr.append(squareModel)
                
                self.headerView.square = self.squareArr
            }
            self.tableView.reloadData()
        }
    }
}
extension DiscoverViewController{

    
    
    
}



