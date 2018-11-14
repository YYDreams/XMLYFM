//
//  FMListenRecommendController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/7.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView
import MJRefresh

class FMListenRecommendController: UIViewController,LTTableViewProtocal {

    
    private lazy var dataArr:[FMListRecommedModel] = [FMListRecommedModel]()
    
    //MARK:Lazy Method
    private lazy var tableView: UITableView = {
        let tableView = tableViewConfig(self, self, .plain)
//        tableView.backgroundColor = UIColor.red
        tableView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH-50-navHeight)
        tableView.register(FMListenRecommendCell.self, forCellReuseIdentifier: "FMListenRecommendCellID")
        tableView.tableFooterView = UIView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        setupTableView()
        


    }


}


extension FMListenRecommendController{
    
    
    private func setupTableView(){
        
        self.view.addSubview(tableView)
        glt_scrollView = tableView
        
 
        setupRefresh()
    }
    
    
}
extension FMListenRecommendController{
    
    private func setupRefresh(){
        //HHRefreshGifHeader
        tableView.mj_header =  HHRefreshGifHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        
        tableView.mj_footer =  MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
        
        tableView.mj_header.beginRefreshing()
        
    }
    
    @objc  func loadNewData(){
        
        print("loadNewData")
        
        loadHomeStatusFromNetwork(isNewData: true)
        
    }
    @objc  func loadMoreData(){
        
        print("loadMoreData")
        
        loadHomeStatusFromNetwork(isNewData: false)
    
  }
}
extension FMListenRecommendController{
    
    
    private func   loadHomeStatusFromNetwork(isNewData:Bool){
        
        var pageId = 0
        
        if isNewData {
            pageId = 1
            
        }else{
            
            pageId += 1
        }
        
        let param = ["device": "iPhone",
                     "pageSize":"10",
                     "pageId": "\(pageId)"
            ] as [String : AnyObject]
        
        
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_6, urlString: kListenSubscribeUrl, parameters: param) { (result, error) in
            
            
            if error != nil {return}
            
            guard let resultDic = result as? [String: AnyObject] else {return}
            
            guard let resultDataDic  = resultDic["data"] as? [String: AnyObject] else {return}
            
            guard let resultDataArr = resultDataDic["albums"] as? [[String : AnyObject]] else {
                return
            }
            var tempDataArr = [FMListRecommedModel]()

            for albums in resultDataArr {
                
                let albumsModel:FMListRecommedModel = FMListRecommedModel.deserialize(from: albums)!
                
                tempDataArr.append(albumsModel)
                
            }
            
            if isNewData {
                
                self.dataArr = tempDataArr + self.dataArr
                
            }else{
                
                self.dataArr += tempDataArr
            }
            
            self.tableView.reloadData()
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            
        }
    }
}

extension FMListenRecommendController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FMListenRecommendCellID") as! FMListenRecommendCell
        cell.model = self.dataArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return  100
    }
    
}


