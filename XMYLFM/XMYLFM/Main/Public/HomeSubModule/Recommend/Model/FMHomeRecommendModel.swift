//
//  FMHomeRecommendModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/9.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHomeRecommendModel: BaseModel {
    

    var item:[[String: String]]?
    
    var itemType: String?

}
class FMHomeRecommendHeaderModel: BaseModel {
    
    var cover: String?
    
    
    var coverPath: String?
    
    var title: String?
    
    var pic: String? // 猜你喜欢icon
    
    var playsCount: Int = 0  //数量
    
    
    
}
