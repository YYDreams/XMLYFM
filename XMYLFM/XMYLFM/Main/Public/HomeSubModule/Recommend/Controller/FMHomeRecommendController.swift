//
//  FMHomeRecommendController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/8.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHomeRecommendController: BaseTableViewController {
    
    private lazy var squareArr: [DiscoverModel] = [DiscoverModel]()

    private lazy var headerView: DiscoverHeaderView = {
        
        let headerView = DiscoverHeaderView(frame: CGRect(x: 0, y: 0, width: screenW, height: 100))
        
        return headerView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
         loadDataFormNetwork()


    }
    

}

extension FMHomeRecommendController{
    
    private func setupTableView(){
        
        tableView.register(FMGuessYouLikeCell.self, forCellReuseIdentifier: "FMGuessYouLikeCellID")
        
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 180))
        tableView.tableHeaderView?.backgroundColor = UIColor.red
        tableView.rowHeight = 300
        
    }
    
    
}
extension FMHomeRecommendController {
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

extension FMHomeRecommendController{
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return  headerView
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FMGuessYouLikeCellID", for: indexPath) as! FMGuessYouLikeCell 
        
        return cell
        
    }
    
    
    
    
}
