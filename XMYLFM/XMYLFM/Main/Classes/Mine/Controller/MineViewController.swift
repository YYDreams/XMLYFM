//
//  MineViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/10/31.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit


private let MineCellID = "MineCellID"
class MineViewController: BaseTableViewController {


    
    
    private lazy var  dataArr: Array = {
       
        return [
          
            [["title":"我的积分"],["title":"我的圈子"],["title":"我的收听偏好"],["title":"推荐给喜马拉雅给好友"]],
            
            [["title":"扫一扫"],["title":"定时关闭"],["title":"夜间模式"]],
            
            [["title":"运营商服务"],["title":"商场"],["title":"0元购"],["title":"知识大使"],["title":"帮助与反馈"]]
              ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: NSNotification.Name(kLoginSuccessNotification), object: nil)
        
        
        
        
        
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadDataFormNetwork()
        
    }
    @objc private func loginSuccess(){
        
        loadDataFormNetwork()
        
        self.tableView.reloadData()
        
    }
    
   

}


extension MineViewController{
    
    
    private func setupTableView(){
        
        tableView.register(UINib(nibName: "MineCell", bundle: nil), forCellReuseIdentifier: MineCellID)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.delegate = self
    }
    
    
}

extension MineViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return  dataArr.count + 1
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return section == 0 ? 1 : dataArr[section - 1].count
        
        
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {


        return indexPath.section == 0 ? 380 : 45
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
   override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
//
        if indexPath.section == 0 {
            let mineCell =  tableView.dequeueReusableCell(withIdentifier: MineCellID, for: indexPath) as! MineCell

            mineCell.handerLoginBtnOnClickCallBack = { () -> Void in

                let loginVc = BaseNavViewController(rootViewController: FMLoginViewController())

                self.present(loginVc, animated: true, completion: nil)

            }

            return mineCell

        }else{
        
            
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         
              cell.textLabel?.text = dataArr[indexPath.section - 1][indexPath.row]["title"]
            return cell
        }
        
  

    }
    
}

//MARK: loadDataFormNetwork
extension MineViewController{
    
    // /mobile/homePage/?date=20181101&device=iPhone&playDuration=0&timestamp=1541043503000&uid=136001372 HTTP/1.1
    
    
    private func loadDataFormNetwork(){
        let param = ["date":"20181101",
                     "device":"iPhone",
                     "playDuration":"0",
                     "timestamp":"1541043503000",
                     "uid":"136001372"
                     ]
        
        NetworkTool.shareNetworkTool().request(methodType: .GET,baseUrl:MAIN_URL_6,urlString: kMobileUrl, parameters: param as [String : AnyObject]) { (result, error) in
            
            
            print("res \(String(describing: result)), \(error)")
            
        }
        
    }
    
    
    
    
    
}


