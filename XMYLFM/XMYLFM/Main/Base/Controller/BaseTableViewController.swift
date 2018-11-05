//
//  BaseTableViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/10/31.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()

       self.view.backgroundColor = bgColor
        
        

    }

  

}
