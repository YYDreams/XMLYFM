//
//  FMFollowController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import LTScrollView
import DZNEmptyDataSet
class FMFollowController: UIViewController,LTTableViewProtocal {

    //MARK: Lazy Method
    private lazy var tableView: UITableView = {
        let tableView = tableViewConfig(self, self, .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH-50-navHeight)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FMFollowCellID")
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()

        return tableView
    }()
    
    //MARK: viewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        glt_scrollView = tableView
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: NSNotification.Name(kLoginSuccessNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: NSNotification.Name(kLogOutNotification), object: nil)

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        
    }
    @objc private func loginSuccess(){
        
        self.tableView.reloadData()
        
        
    }


}
//MARK: <UITableViewDelegate,UITableViewDataSource>

extension FMFollowController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return !( LoginHelper.sharedInstance.userInfo?.isLogin ?? false) ? 0 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FMFollowCellID", for: indexPath)

        cell.textLabel?.text = "亲 我已经登录了呦"
        
        
        return cell
        
    }

}
//MARK: <DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
extension FMFollowController:DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        
        return  UIImage(named: "img_reject")
        
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        
 
       let    dic = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15),
                     NSAttributedStringKey.backgroundColor:kThemeColor,
                     NSAttributedStringKey.foregroundColor:UIColor.white
                ]     as [NSAttributedStringKey : Any]

        return NSAttributedString(string: "  关注感兴趣的人  ", attributes: dic )

    }
    


    //设置间隙  默认11
    func spaceHeight(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        
        return 20
    }
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        
        
        let loginVc = BaseNavViewController(rootViewController: FMLoginViewController())
        
        self.present(loginVc, animated: true, completion: nil)
        
        print("=======\(button) \(button.titleLabel?.text)")
        
        
    }
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        
        return true
    }

    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        
        let text = "关注的人更新动态会出现在这里"
        let dic = [kCTFontAttributeName:UIFont.systemFont(ofSize: 13),
                   kCTForegroundColorAttributeName:UIColor.darkGray
                   ]     as [NSAttributedStringKey : Any]
     
        return NSAttributedString(string: text, attributes: dic )
        
    }
    
    
}






