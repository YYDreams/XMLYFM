//
//  FMLoginViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/1.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMLoginViewController: UIViewController {


    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var paawordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "登录"
    }

    @IBAction func loginBtnOnClick(_ sender: UIButton) {
        
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_MOCKY, urlString: kLoginUrl, parameters: [:]) { (result, error) in

            
            guard  let resultDic  = result as? [String : AnyObject] else{
                
                return
            }

            let infoModel:UserInfoModel = UserInfoModel.deserialize(from: resultDic)!
            
            if infoModel.ret == 0 {
                LoginHelper.sharedInstance.userInfo = infoModel
                LoginHelper.sharedInstance.saveUserInfo(userInfo: infoModel)
                LoginHelper.loginSuccessDataHandle()
                    self.dismiss(animated: true, completion: nil)

            }
        }

    }

}

