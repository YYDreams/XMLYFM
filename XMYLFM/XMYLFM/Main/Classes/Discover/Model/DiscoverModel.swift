//
//  DiscoverModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/2.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class DiscoverModel: BaseModel {

    var coverPath: String? //图片url
    
    var title: String? //title
    
    var contentType: String? // 类型
    
    
    var url: String? // 如果类型(contentType)是html5  则跳转  如果类型是html5则必定存在跳转url地址
    
    
    
}
/**
 {
 "bubbleText":"",
 "contentType":"iting",
 "contentUpdatedAt":0,
 "coverPath":"http://fdfs.xmcdn.com/group47/M01/0E/32/wKgKm1uWFevRVPcKAAARLAqyQtU444.png",
 "displayClass":"one_line",
 "enableShare":false,
 "externalUrlOrNot":false,
 "hotOrNot":false,
 "id":211120,
 "orderNum":0,
 "properties":{
 "isPaid":false,
 "type":"",
 "uri":"iting://open?msg_type=94&bundle=rn_book"
 },
 "sharePic":"",
 "subtitle":"",
 "title":"看小说",
 "url":""
 },
 
 */
