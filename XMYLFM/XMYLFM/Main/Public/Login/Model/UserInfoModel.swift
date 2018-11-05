//
//  UserInfoModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import HandyJSON
class UserInfoModel: NSObject,HandyJSON,NSCoding {
    required override init() { }

    var token: String? //户授权的唯一票据
    
    var uid: String? //用户的uid
    
    var ret: Int = 1 //返回的状态码  0: 表示成功
    
    class func isLoginStatus() -> Bool { //保存用户的登录状态
        
        return UserInfoModel.loadAccount() != nil
    }
    
    static var account: UserInfoModel?
    
    class func loadAccount() -> UserInfoModel? {
        
        // 1.判断是否已经进行加载过
        if account != nil {
            return account
        }
        
        // 2.如果没有加载过，进行加载
        account = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? UserInfoModel

        return account
        
    }
    
    static let filePath = NSHomeDirectory() + "/Library/Caches" + "/account.plist"
    
    func saveAccount(){
        print("filePath:\(UserInfoModel.filePath)")
        
        //  将对象写入到文件中(归档) NSKeyedArchiver
        NSKeyedArchiver.archiveRootObject(self, toFile: UserInfoModel.filePath)
        
    }
  class func clearAccount(){
  
    let clearUserInfo:Bool = ((try?  FileManager.default.removeItem(atPath: UserInfoModel.filePath)) != nil)
    
    
    clearUserInfo ? print("清除用户数据成功"):print("清除用户数据失败");

  
    }
    public func encode(with aCoder: NSCoder) {

        aCoder.encode(token, forKey: "token")
        aCoder.encode(uid, forKey: "uid")
    }

    required init?(coder aDecoder: NSCoder) {
        token = aDecoder.decodeObject(forKey: "token") as? String
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        
    }
}
