//
//  FMHomeRecommendController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/8.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHomeRecommendController: BaseTableViewController {
    
    private lazy var focusArr: [FMHomeRecommendHeaderModel] = [FMHomeRecommendHeaderModel]()
    private lazy var squareDataArr: [DiscoverModel] = [DiscoverModel]() 
    private lazy var guessYouLikeArr:[FMHomeRecommendHeaderModel] = [FMHomeRecommendHeaderModel]()

    private lazy var headerView: DiscoverHeaderView = {
        
        let headerView = DiscoverHeaderView(frame: CGRect(x: 0, y: 0, width: screenW, height: 100))
        
        return headerView
        
    }()
    private lazy var bannerView: FMHomeHeaderView = {
        
        let bannerView = FMHomeHeaderView(frame: CGRect(x: 0, y: 0, width: screenW, height: 200))
        
        return bannerView
        
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
        tableView.tableHeaderView = self.bannerView
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
     

            for heaer in headerArr {
                
                guard let itemDic = heaer["item"] else { return }

                
                guard  let moduleType:String = (itemDic["moduleType"] as? String) else { return}
          
                if moduleType == "focus"{ // 轮播图
                    
                    guard  let focusList:[[String:AnyObject]] = (itemDic["list"] as? [[String:AnyObject]]) else { return }
                    
                    for listData in focusList{
                        
                        
                        guard   let listDataA = listData["data"] as? [[String:AnyObject]] else {return}
                        
                        for listDataB in listDataA {
                            
                            let model = FMHomeRecommendHeaderModel.deserialize(from: listDataB)!
                            
                            self.focusArr.append(model)
                        }
                        
                    }

                    
                }else if(moduleType == "square"){ //方块
                    
                    guard  let squareList:[[String:AnyObject]] = (itemDic["list"] as? [[String:AnyObject]]) else { return }

                    for square in squareList {
                        
                        let model:DiscoverModel = DiscoverModel.deserialize(from: square)!

                        self.squareDataArr.append(model)
                        
                    }
                    
                }else { //猜你喜欢
                    
                    guard let guessYouLikeList:[[String:AnyObject]] = (itemDic["list"] as? [[String:AnyObject]]) else{ return}
                    
                    for guessYouLike in guessYouLikeList {
                        
                        let model: FMHomeRecommendHeaderModel = FMHomeRecommendHeaderModel.deserialize(from: guessYouLike)!
                        
                        self.guessYouLikeArr.append(model)
                    }
                    
                }
                
                
            }
            
            self.tableView.reloadData()
            self.headerView.square = self.squareDataArr
            self.bannerView.dataArr = self.focusArr
            print("%=====cfocusArr=======\(self.focusArr.count)")
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
        cell.dataArr = self.guessYouLikeArr
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
