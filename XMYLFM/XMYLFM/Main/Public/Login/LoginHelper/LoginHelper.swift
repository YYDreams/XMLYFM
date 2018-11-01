//
//  LoginHelper.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/1.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class LoginHelper: NSObject,NSCoding {

    
    
    var token: String? //户授权的唯一票据
    
    var uid: String?
    
    
    class func isLoginStatus() -> Bool {
        
        return LoginHelper.loadAccount() != nil
    }
    
    static var account: LoginHelper?

    class func loadAccount() -> LoginHelper? {
    
        
        // 1.判断是否已经进行加载过

        if account != nil {
            return account
        }
        
        // 2.如果没有加载过，进行加载

        account = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? LoginHelper
        
    
        return account
    
    }
    
    static let filePath = NSHomeDirectory() + "/Library/Caches" + "/account.plist"
    
    func saveAccount(){
        //  将对象写入到文件中(归档) NSKeyedArchiver
        NSKeyedArchiver.archiveRootObject(self, toFile: LoginHelper.filePath)
        
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
