//
//  MineModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/2.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class MineModel: BaseModel {

    
    var nickname: String? // 昵称
    
    var userTitle: String? //宝宝
    
    
    var followings: Int = 0
    var favorites: Int = 0

    
    var mobile: String?
    
    var uid: String?
    
    var checkInRemindInfo:CheckInRemindInfoModel?

    
    var vipTip: String?
    
    /**
     
     "vipResourceInfo":{
     "title":"免费领取7天会员",
     "url":"http://m.ximalaya.com/vip/product/ts-1541122725454"
     },
     
     
     "checkInRemindInfo":{
     "iconPath":"http://fdfs.xmcdn.com/group45/M04/30/F0/wKgKjltgEdPhJ6XDAAA6C82JPus212.gif",
     "checkInReminder":"待领取积分",
     "checkInReward":"+5积分",
     "serverDate":20181102,
     "playDuration":0,
     "signature":"cb4b11ebc6c0be2ccf4525ce9c0aaa1f"
     },
     
     
     "communityInfo":{
     "url":"iting://open?msg_type=82",
     "isWhiteListUser":false,
     "isShowRedDot":false,
     "showType":3,
     "showDetail":"多听，多看，多聊",
     "noticeText":"新功能圈子上线了，抢先一步体验吧",
     "hasPermissionToCreateCommunity":false,
     "hasNews":false
     },
     
     */
    
}





class CheckInRemindInfoModel: BaseModel {
    
    var iconPath: String? //
    
    var checkInReminder: String? //
    
    
    var checkInReward: String?


}

