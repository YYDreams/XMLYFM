//
//  FMSubscribeController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/7.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView
class FMSubscribeController: UIViewController,LTTableViewProtocal {
    
    
    private lazy var dataArr:[FMSubscribeModel] = [FMSubscribeModel]()
    
    //MARK:Lazy Method
    private lazy var tableView: UITableView = {
        let tableView = tableViewConfig(self, self, .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH-50-navHeight)
        //与我听中的推荐cell共用
        tableView.register(FMListenRecommendCell.self, forCellReuseIdentifier: "FMSubcribeCellID")
        
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        
        loadDataFormNetwork()
        
    }
    
    
}
extension FMSubscribeController{
    
    
    private func loadDataFormNetwork(){

        
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_MOCKY, urlString: kDiscoverySubscribeUrl, parameters: [:]) { (result, error) in
            
            if error != nil { return}
            
            
            guard let resultDic = result as? [String: AnyObject] else {return}
            
            guard let resulrData = resultDic["data"] as? [String: AnyObject] else {return}
        
            guard let resultDataArr =  resulrData["albumResults"] as? [[String: AnyObject]] else {return}
            
            for  albumResults in  resultDataArr{
                
                let model:FMSubscribeModel = FMSubscribeModel.deserialize(from: albumResults)!
                
                self.dataArr.append(model)
            }
            self.tableView.reloadData()
        }
    }
    
    
}
extension FMSubscribeController{
    
    
    private func setupTableView(){
        
        self.view.addSubview(tableView)
        glt_scrollView = tableView
        
    }
    
    
}

extension FMSubscribeController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FMSubcribeCellID") as! FMListenRecommendCell
        cell.subscribeModel = self.dataArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return  100
    }
    
}





