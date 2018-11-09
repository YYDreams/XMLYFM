//
//  FMHomeRecommendController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/8.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHomeRecommendController: BaseTableViewController {
    
    private lazy var dataArr: [FMHomeRecommendHeaderModel] = [FMHomeRecommendHeaderModel]()

    private lazy var headerView: DiscoverHeaderView = {
        
        let headerView = DiscoverHeaderView(frame: CGRect(x: 0, y: 0, width: screenW, height: 100))
        
        return headerView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
          setupTableView()


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDataFormNetwork()

    }

}

extension FMHomeRecommendController{
    
    private func setupTableView(){
        
        tableView.register(FMGuessYouLikeCell.self, forCellReuseIdentifier: "FMGuessYouLikeCellID")
        
        print("tableView.frame\(tableView.frame)")
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 180))
        tableView.tableHeaderView?.backgroundColor = UIColor.red
        tableView.rowHeight = (screenW - 120)/2.0 * 2 + 20
        
    }
    
    @objc private func refreshOnClick(){
        
        print("refreshOnClickrefreshOnClick")
    }
    
}
extension FMHomeRecommendController {
    private func loadDataFormNetwork(){
        
 
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL, urlString: kHomeAllUrl, parameters: [:]) { (result, error) in
            
            if error != nil {
                return
            }
            
            guard let resultDic   = result  as? [String: AnyObject] else  {return}
            
            
            guard let headerArr = resultDic["header"] as? [[String : AnyObject]] else {return}
            
            for (_, header) in headerArr.enumerated() {
               
               
                let item = header["item"] as? [String:AnyObject]

                
                guard let itemList = item!["list"] as? [[String:AnyObject]] else {return}
                
                for data in itemList{
                    
                    guard let dataArr = data["data"] as? [[String: AnyObject]]  else {return}
                    
    
                    
                    for dataM in dataArr {
                        
                        
                        let dataModel:FMHomeRecommendHeaderModel = FMHomeRecommendHeaderModel.deserialize(from: dataM)!
                        
                        
                        self.dataArr.append(dataModel)
                        
                    }
                    
                }

            }
            
            print("=================\(self.dataArr)==========================\(self.dataArr.count)")

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
    
    
  override  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 40))
    
        let  refreshBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: footerView.frame.height))
             refreshBtn.center = footerView.center
             refreshBtn.setTitle("换一批", for: .normal)
             refreshBtn.backgroundColor = kBtnBgColor
             refreshBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
             refreshBtn.layer.cornerRadius = 10
             refreshBtn.layer.masksToBounds = true
             refreshBtn.setTitleColor(kThemeColor, for: .normal)
             refreshBtn.addTarget(self, action: #selector(refreshOnClick), for: .touchUpInside)
    
            footerView.addSubview(refreshBtn)
         return footerView
    
        
    }
   override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
}
