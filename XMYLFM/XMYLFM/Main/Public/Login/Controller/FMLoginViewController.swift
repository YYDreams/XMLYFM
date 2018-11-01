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

    }

    @IBAction func loginBtnOnClick(_ sender: UIButton) {
        

        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_6, urlString: kPassportTokenLogin, parameters: [:]) { (result, error) in

            print("result\(result) error\(result)")
//
//            if let dic = result as? [String: AnyObject]{
//
//                let ret = dic["ret"] as? Int
//
//                if ret == 0 {
//
//
                    NotificationCenter.default.post(name: NSNotification.Name(kLoginSuccessNotification), object: nil)

                    self.dismiss(animated: true, completion: nil)
//                }
//
//            }

        }

        
    }
    
    
    
 

}
