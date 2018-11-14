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
    
    var isLogin: Bool{
        
        if LoginHelper.sharedInstance.userInfo?.token != nil {

            return true
        }else {
            return false
        }
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
