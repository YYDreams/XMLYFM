//
//  FMIntereDubController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView

class FMIntereDubController: UIViewController,LTTableViewProtocal {
    
    private lazy var dataArr: [FMIntereDubModel] = [FMIntereDubModel]()
    private var cellHeight: CGFloat = 0.0
    //MARK:Lazy Method
    private lazy var tableView: UITableView = {
        let tableView = tableViewConfig(self, self, .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH-50-navHeight)
        tableView.register(UINib(nibName: "FMInterestDubCell", bundle: nil), forCellReuseIdentifier: "FMInterestDubCellID")

        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupTableView()

   loadDataFormNetwork()
        
   }

}

//MARK: - loadDataFormNetwork
extension FMIntereDubController{
    
    //http://180.153.255.6/discovery-stream-mobile/discoveryPage/wholeContent/tabs/ts-1541140247973?channel=ios-b1&code=43_440000_4403&device=iPhone&version=6.5.24
    private func loadDataFormNetwork(){
        
      
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_MOCKY, urlString: kDiscoverIntereDubUrl, parameters: [:]) { (result, error) in
            
            if error != nil {
                return
            }
            
            
            guard let resultDic = result as? [String : AnyObject] else {return}
            
            
            guard   let  resultData = resultDic["data"] as? [[String : AnyObject]] else {
                
                return
            }
 
    
            for  dataDic in resultData {
                
                
                let dubModel: FMIntereDubModel = FMIntereDubModel.deserialize(from: dataDic)!
                self.dataArr.append(dubModel)
                
                
                
            }
    
            self.tableView.reloadData()
        }
    }
}


//MARK:setupUI Method

extension FMIntereDubController{
    
    private func setupTableView(){
        
        self.view.addSubview(tableView)
//        tableView.rowHeight = UITableViewAutomaticDimension  // 根据约束自动计算  如果需要手动计算 则需要去掉
//        tableView.estimatedRowHeight = 248
        glt_scrollView = tableView

        
    }

}
extension FMIntereDubController: UITableViewDelegate, UITableViewDataSource{

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //FIXME: 注意初始化 注释地方打开会发现高度重叠了
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FMInterestDubCellID", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "FMInterestDubCellID")  as! FMInterestDubCell

        cell.model = dataArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return dataArr[indexPath.row].cellHeight


    }
    
}


