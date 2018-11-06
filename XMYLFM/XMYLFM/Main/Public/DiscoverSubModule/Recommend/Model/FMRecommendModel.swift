//
//  FMRecommendModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/6.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMRecommendModel: BaseModel {

    var avatar: String? //头像
    
    var nickname: String?
    
    var issuedTs: Double = 0
    
    var content: String?  // 正文内容
    
    
    var likesCount: Int = 0 // 点赞
    
    var commentsCount: Int = 0 // 评论数量
    
    var picUrls: [[String : String]]?
    
}

