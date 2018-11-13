//
//  FMHomeRecommendModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/9.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHomeRecommendModel: BaseModel {

    var focus:FMHomeRecommendHeaderModel? //轮播图
    
    var square:DiscoverModel? //square
    
    var guessYouLike:[FMHomeRecommendHeaderModel]? //猜你喜欢
    
    var hotSearchList: FMHotSearchListModel?  //喜马热搜榜

}


class FMHomeRecommendHeaderModel: BaseModel {
    
    var cover: String?
    
    
    var coverPath: String?
    
    var title: String?
    
    var pic: String? // 猜你喜欢icon
    
    var playsCount: Int = 0  //数量
    
    
    /**
     猜你喜欢里面的list
     {
     "albumId":7251132,
     "category":"外语",
     "categoryId":5,
     "infoType":"play_or_score",
     "isDraft":false,
     "isFinished":2,
     "isFollowing":false,
     "isPaid":false,
     "isVipFree":false,
     "lastUptrackAt":1490066756000,
     "materialType":"album",
     "nickname":"常春藤赖世雄英语",
     "originalStatus":0,
     "pic":"http://imagev2.xmcdn.com/group26/M05/60/D7/wKgJRljQm-KBvB-pAAVkSLGFG98476.jpg!op_type=5&upload_type=album&device_type=ios&name=large",
     "playsCount":1740916,
     "recSrc":"UCFJ5",
     "recTrack":"GUA.gylV5.1063",
     "refundSupportType":0,
     "subscribeStatus":false,
     "subtitle":"L30朗读",
     "title":"《赖世雄美语从头学美语入门》朗读音频",
     "tracksCount":30,
     "vipFreeType":0
     }
     
     */
}

class FMHomeRecommendLiveModel: BaseModel {

    
    var coverLarge: String?
    var coverMiddle: String?
    var categoryName: String?
    var name:String?

    var nickname:String?
    var playCount: Int = 0
    
    
}

class  FMHotSearchListModel:BaseModel {
    
    var shift: Int = 0  // 1:上升  -1:下降
    var word: String? //热搜name
    
}


class FMHomeAlbumModel: BaseModel {
    
    
    var category: String?
    var title: String?
    var intro: String?
    var name:String?
    var coverPath:String?
    
    
    var playsCounts: Int = 0
    var tracks: Int = 0
    
    
}
