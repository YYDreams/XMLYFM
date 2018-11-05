//
//  FMIntereDubModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMIntereDubModel: BaseModel {

    
    var playTimes: Int = 0  //X次播放  播放次数
    
    var duration: Int = 0 //播放时间
    
    var title: String? //title
    
    var topicTitle: String?  //#一人一句古风
    var logoPic: String? //头像
    
    var nickname: String? //昵称
    
    var favorites: Int = 0 //点赞数量
    
    var commentCount: Int = 0 // 信息数量
    
    var coverLarge: String? //大图
    
    var coverMiddle: String? //中图
    
    var coverSmall: String? //小图
 
    var feedItem: FeedItemModel?

    
    var playPathAacv164: String?
    
    var playPathAacv224: String?
    
  
    
    
 
}

class FeedItemModel: BaseModel {
    
    
    var recReason: String? //新品
    
    var contentId: Int = 0 // contentId

  
}
