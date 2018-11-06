//
//  FMRecommendController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView
private let FMRecommendCellID = "FMRecommendCellID"

class FMRecommendController: UIViewController,LTTableViewProtocal {
    
    //MARK:Lazy Method
    private lazy var viewModel: [DiscoverViewModel] = [DiscoverViewModel]()

    private lazy var tableView: UITableView = {
        let tableView = tableViewConfig(self, self, .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH-50-navHeight)
        tableView.register(UINib(nibName: "FMRecommendCell", bundle: nil), forCellReuseIdentifier: FMRecommendCellID)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()

        loadDataFormNetwork()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showPhotoBrowser), name: NSNotification.Name(kRecommendPhotoSelectItemNotification), object: nil)
    }
//MARK:deinit

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK:setupTableView
extension FMRecommendController{
    
    private func setupTableView(){
        
        self.view.addSubview(tableView)
        glt_scrollView = tableView
    }
}
//MARK:SEL Method
extension FMRecommendController{
    
    @objc  func showPhotoBrowser(noti:Notification){
        
        print("noti\(noti)")
        
        let indexPath = noti.userInfo![kRecommendShowPhotoBrowserIndexKey]  as! IndexPath
        let picUrls = noti.userInfo![kRecommendShowPhotoBrowserUrlKey] as! [NSURL]
        let photoBrowserVc = FMPhotoBrowserController(indexPath: indexPath, picUrls: picUrls)
        //FIXME后期完善自定义转场动画
        present(photoBrowserVc, animated: true, completion: nil)
    }

}
//MARK:loadDataFormNetwork
extension FMRecommendController{
    
    private func loadDataFormNetwork(){
        
        DiscoverViewModel.loadRecommendDataFormNetwork { (result, error) in
            
            guard let resultArr  = result else{ return }

            self.viewModel.append(resultArr)

            self.tableView.reloadData()
            
        }
    }
}
//MARK:<UITableViewDataSource,UITableViewDelegate>
extension FMRecommendController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: FMRecommendCellID) as! FMRecommendCell

       cell.viewModel = self.viewModel[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return  viewModel[indexPath.row].cellHeight
    }
}
