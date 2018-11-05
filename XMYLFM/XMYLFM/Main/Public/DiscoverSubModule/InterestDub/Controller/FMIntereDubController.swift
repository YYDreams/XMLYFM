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
    //MARK:Lazy Method
    private lazy var tableView: UITableView = {
        let tableView = tableViewConfig(self, self, .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH-50-navHeight)
        tableView.register(UINib(nibName: "FMInterestDubCell", bundle: nil), forCellReuseIdentifier: "FMInterestDubCellID")
        tableView.rowHeight = 240

        
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
        
      
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL, urlString: kDiscoverIntereDubUrl, parameters: [:]) { (result, error) in
            
            if error != nil {
                return
            }
            
            guard  let resultDic  = result as? [String : AnyObject] else{
                return
            }
            
//            let dataDic = resultDic["data"] as? [[String: AnyObject]]
            

            
            guard let resultArr =  resultDic["data"]!["dubbingItem"] as? [[String: AnyObject]] else{
                return
            }

//            guard let  dubbingItem = dataDic!["dubbingItem"] else{ return}
            for dubbingModel in resultArr {
                
                let model: FMIntereDubModel = FMIntereDubModel.deserialize(from: dubbingModel)!
                
                self.dataArr.append(model)
                
            }
            

            self.tableView.reloadData()
        }
    }
}


//MARK:setupUI Method

extension FMIntereDubController{
    
    private func setupTableView(){
        
        self.view.addSubview(tableView)
        
        glt_scrollView = tableView

        
    }

}
extension FMIntereDubController: UITableViewDelegate, UITableViewDataSource{

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FMInterestDubCellID", for: indexPath)  as! FMInterestDubCell
        cell.model = self.dataArr[indexPath.row]
        return cell
    }
    
        
    
}


