//
//  FMCircleController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView
private let DiscoverCircleCellID = "DiscoverCircleCellID"
private let DiscoverCircleDefaltCellID = "DiscoverCircleDefaltCellID"

class FMCircleController: UIViewController,LTTableViewProtocal {

    
    
    private lazy var dataArr: [FMCircleModel] = [FMCircleModel]()

    //MARK:Lazy Method
    private lazy var tableView: UITableView = {
        let tableView = tableViewConfig(self, self, .grouped)
        tableView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH-50-navHeight)
        tableView.register(FMCircleViewCell.self, forCellReuseIdentifier: DiscoverCircleCellID)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: DiscoverCircleDefaltCellID)


        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        setupTableView()
        
        
        loadDataFormNetwork()
    }
}


//MARK:loadDataFormNetwork Method

extension FMCircleController{
 
    private func loadDataFormNetwork(){
        
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_M_XMLY, urlString: kDiscoveryCommunityUrl, parameters: [:]) { (result, error) in
            
            
            if error != nil{
                
                print("error\(String(describing: error))")
            }
            
            guard  let resultDic  = result as? [String : AnyObject] else{ return }

            let dataDic = resultDic["data"]
            
            guard let resultDataArr  = dataDic as? [[String: AnyObject]] else { return}
            
            for data in resultDataArr {
                
                let circleModel: FMCircleModel = FMCircleModel.deserialize(from: data)!
                
                self.dataArr.append(circleModel)
                
            }
            self.tableView.reloadData()
            
        }
        
    }
    
}
//MARK:setupUI Method

extension FMCircleController{
    
    private func setupTableView(){
        
        self.view.addSubview(tableView)
        glt_scrollView = tableView

        
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 150))

        let imgView = UIImageView(image: UIImage(named: "pay_banner"))
        
        imgView.frame = CGRect(x: 10, y: 10, width: screenW - 2 * 10, height: 150 - 2 * 10)
        
        footerView.addSubview(imgView)
        tableView.tableFooterView =  footerView
        
    }
    
    
    
}
//MARK:<UITableViewDelegate, UITableViewDataSource>
extension FMCircleController: UITableViewDelegate, UITableViewDataSource{
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

     let view = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 30))
         view.backgroundColor = UIColor.white
    let label = UILabel(frame: CGRect(x: 10, y: (30 - 14)/2, width: screenW, height:30))
        label.text = section == 0 ? "我加入的":"你可能感兴趣的圈子"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
      
        view.addSubview(label)
        return view
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return indexPath.section == 0 ? 100: 150
        
    }
    
  

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverCircleDefaltCellID, for: indexPath)
           cell.textLabel?.text = "你还没有加入任何圈子呦"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textAlignment =  .center
            cell.textLabel?.textColor = k9Color
            return cell
        }
        
        let circleCell = tableView.dequeueReusableCell(withIdentifier: DiscoverCircleCellID, for: indexPath) as! FMCircleViewCell

        circleCell.dataArr = self.dataArr
        
        return circleCell
    }
    

}

