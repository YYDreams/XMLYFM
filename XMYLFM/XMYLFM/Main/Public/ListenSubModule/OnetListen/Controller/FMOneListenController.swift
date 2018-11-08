//
//  FMOneListenController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/7.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView
class FMOneListenController: UIViewController,LTTableViewProtocal {
    
    private lazy var dataArr: [FMOneListenModel] = [FMOneListenModel]()
    private lazy var addBtn: UIButton = {
       let addBtn = UIButton()
        
        addBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        addBtn.setTitle("+ 添加频道", for: .normal)
        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        addBtn.layer.cornerRadius = 15
        addBtn.setTitleColor(UIColor.black, for: .normal)
        addBtn.addTarget(self, action: #selector(addBtnOnClick), for: .touchUpInside)
        addBtn.layer.masksToBounds = true
        addBtn.backgroundColor = kBtnBgColor
        return addBtn
    }()
    //MARK:Lazy Method
    private lazy var tableView: UITableView = {
        let tableView = tableViewConfig(self, self, .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH-50-navHeight)
        tableView.register(FMOneListenCell.self, forCellReuseIdentifier: "FMOneListenCellID")
        tableView.rowHeight = 120
        let footView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 50))
        addBtn.center = footView.center
        footView.addSubview(addBtn)
        tableView.tableFooterView = footView
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
          setupTableView()
        
          loadDataFormNetwork()
    }
}

extension FMOneListenController{
    
    
    private func loadDataFormNetwork(){
        
        
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL, urlString: kOnetListenUrl, parameters: [:]) { (result, error) in
            
            if error != nil { return }
            
            guard let resultDic = result as? [String: AnyObject] else{  return }
            
            guard let resultDataDic = resultDic["data"] as? [String: AnyObject] else{ return }
            
            guard   let resultDataArr = resultDataDic["channelResults"] as? [[String: AnyObject]] else {  return }
            
            for  channelResults in resultDataArr {
                
                let oneListModel: FMOneListenModel = FMOneListenModel.deserialize(from: channelResults)!
                
                self.dataArr.append(oneListModel)
                
            }
            self.tableView.reloadData()
        }
    }
}
extension FMOneListenController{
 
    private func  setupTableView(){
  
        self.view.addSubview(tableView)
        glt_scrollView = tableView
        
    }
}
extension FMOneListenController{
    
    
 @objc  private func  addBtnOnClick(){

    navigationController?.pushViewController(FMListenChannelController(), animated: true)
    

    }
}
//MARK:<UITableViewDataSource,UITableViewDelegate>
extension FMOneListenController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FMOneListenCellID") as! FMOneListenCell
        cell.oneListModel = self.dataArr[indexPath.row]
        return cell
    }
}
