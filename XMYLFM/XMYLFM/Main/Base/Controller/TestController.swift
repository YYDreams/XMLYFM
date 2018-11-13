//
//  TestController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/13.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class TestController: BaseUIViewController {

    lazy var tableView:UITableView = {
        
       let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: screenW, height: screenH), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        if #available(iOS 11.0, *){
            
            tableView.contentInsetAdjustmentBehavior = .never
            
        }else {
            
            automaticallyAdjustsScrollViewInsets = false
        }
        tableView.tableFooterView = UIView()
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      view.addSubview(tableView)
    }


}

extension TestController:UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
}
