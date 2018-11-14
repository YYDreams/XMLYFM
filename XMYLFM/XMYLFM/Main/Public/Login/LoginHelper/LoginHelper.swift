//
//  LoginHelper.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/1.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import Foundation
var instance:LoginHelper? = nil


class LoginHelper: NSObject {
    
   

    var userInfo:UserInfoModel? {
        didSet{
            guard userInfo != nil else {
                return
            }
        }
    }
    
    static let sharedInstance: LoginHelper = {
        
          instance = LoginHelper()
        
        instance?.userInfo = UserInfoModel()

         let saveModel = NSKeyedUnarchiver.unarchiveObject(withFile: UserDataFilePath)
        
        print("path:\(UserDataFilePath)")
        if (saveModel != nil) {
            
            instance?.userInfo = (saveModel as! UserInfoModel)
        }
        
        return instance!
        
    }()
    
    
//保存用户信息
    func saveUserInfo(userInfo: UserInfoModel) {
        
        
        NSKeyedArchiver.archiveRootObject(userInfo, toFile: UserDataFilePath)
    }
    
    
    //清除用户信息
    func clearUserInfo() {
        
        instance = nil

        userInfo?.token = nil
        NotificationCenter.default.post(name: NSNotification.Name(kLogOutNotification), object: nil)

        let clearUserInfo:Bool = ((try?  FileManager.default.removeItem(atPath: UserDataFilePath)) != nil)
        
        clearUserInfo ? print("清除用户数据成功"):print("清除用户数据失败")
    }
  
    
}
