//
//  FMSubscribeModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/7.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMSubscribeModel: BaseModel {

    
    var albumCover: String? //头像
    
    var albumId: Int = 0   //albumId
    
    var albumTitle: String? //title
    
    var trackTitle: String? //subTitle
    
    var lastUpdateAt: Double = 0  //最后更新时间

}

/**

 
 {
 "albumCover":"http://imagev2.xmcdn.com/group32/M01/6E/90/wKgJUFn4EV_DiI8AAAEhxSLI2pw799.jpg!op_type=5&upload_type=album&device_type=ios&name=large",
 "albumId":321787,
 "albumTitle":"蕊希电台",
 "avatar":"http://fdfs.xmcdn.com/group16/M0B/6D/A5/wKgDalc63eXA7hTbAAEAEiwfx1Q547_mobile_small.jpg",
 "dynamicType":1,
 "isDraft":false,
 "isPaid":false,
 "isTop":false,
 "lastUpdateAt":1541557849000,
 "nickname":"蕊希Erin",
 "serialState":1,
 "status":1,
 "timeline":15416415370000,
 "trackId":134834611,
 "trackTitle":"" 以前打扰了，以后不会了。 "",
 "trackType":1,
 "uid":1363000,
 "unreadNum":0,
 "vipFreeType":0
 }
 
 */
