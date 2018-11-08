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
    //MARK: -  Lazy Methods
    private lazy var model: MineModel = MineModel()

    private lazy var  dataArr: Array = {
       
        return [
          
            [["title":"我的积分"],["title":"我的圈子"],["title":"我的收听偏好"],["title":"推荐给喜马拉雅给好友"]],
            
            [["title":"扫一扫"],["title":"定时关闭"],["title":"夜间模式"]],
            
            [["title":"运营商服务"],["title":"商场"],["title":"0元购"],["title":"知识大使"],["title":"帮助与反馈"]]
              ]
    }()
    
    

//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem.title = UserInfoModel.isLoginStatus() ? "账户" : "未登录"

           setupNav()
        
          setupTableView()
        
        loadDataFormNetwork()

        addNotification()

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: addNotification Method

extension MineViewController{
    
    private func addNotification(){
        
                NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: NSNotification.Name(kLoginSuccessNotification), object: nil)
    }
  
}


//MARK: setupUI Methods
extension MineViewController{
    
    
    private func setupTableView(){
        
        tableView.register(UINib(nibName: "MineCell", bundle: nil), forCellReuseIdentifier: MineCellID)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.delegate = self
    }
    
    private func setupNav(){
        
        let messageBtn = UIBarButtonItem.item(imageName: "msg", target: self, action: #selector(messageOnClick))
        let settingBtn = UIBarButtonItem.item(imageName: "set", target: self, action: #selector(settingOnClick))

        navigationItem.rightBarButtonItems  = [settingBtn,messageBtn]

    }
}
//MARK: SEL Methods
extension MineViewController{
    
    
    @objc private func loginSuccess(){
        
        
        print("token:\(String(describing:UserInfoModel.loadAccount()?.token))")
        
        print("isLoginStatus:-----\(UserInfoModel.isLoginStatus())")
        loadDataFormNetwork()
        
        
        
        self.tabBarItem.title = "账户"
        
        
    }
    
    @objc private func messageOnClick(){
        
        print("messageOnClick")
        
    }
    @objc private func settingOnClick(){
        
        print("settingOnClick")

        UserInfoModel.clearAccount()
        
    }
    
}

//MARK: loadDataFormNetwork
extension MineViewController{
    
    private func loadDataFormNetwork(){
        
        
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_MOCKY, urlString: kMobileUrl, parameters: [:]) { (result, error) in
            if error != nil {  return  }
            
            guard  let resultDic  = result as? [String : AnyObject] else{
                
                return
            }
            
            let   object:MineModel = MineModel.deserialize(from: resultDic)!
            
            self.model = object
            
            self.tableView.reloadData()
            
        }
    }
    
}


//MARK: <UITableViewDataSource>
extension MineViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return  dataArr.count + 1
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return section == 0 ? 1 : dataArr[section - 1].count

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {


        return indexPath.section == 0 ? 375 : 45
        
    }
    
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    return UIView()
    
    }
   override  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let mineCell =  tableView.dequeueReusableCell(withIdentifier: MineCellID, for: indexPath) as! MineCell
             mineCell.model = self.model
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
