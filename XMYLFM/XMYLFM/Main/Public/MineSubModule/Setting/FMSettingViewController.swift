//
//  FMSettingViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/14.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMSettingViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
          title = "设置"
          setupSubView()
        
    }
    
    private func setupSubView(){
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingCellID")
        
        let footView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 50))
        
        
        let footerBtn = UIButton(frame: CGRect(x: 10, y: 5, width: screenW - 2 * 10 ,height: 40))
        footerBtn.addTarget(self, action: #selector(logoutBtnOnClick), for: .touchUpInside)
        footerBtn.setTitleColor(UIColor.white, for: .normal)
        footerBtn.backgroundColor = kThemeColor
        footerBtn.setTitle("退出", for: .normal)
        footerBtn.layer.cornerRadius = 10
        footerBtn.layer.masksToBounds = true
        footView.addSubview(footerBtn)
        
        
        
        tableView.tableFooterView = footView
        
    }

    @objc private func logoutBtnOnClick(){
        
       LoginHelper.loginOutDataHandle()
        navigationController?.popViewController(animated: true)
        
    }
   

}


extension FMSettingViewController{
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCellID", for: indexPath)
        
        cell.textLabel?.text = "清除占用空间"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
}
