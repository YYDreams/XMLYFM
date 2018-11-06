//
//  FMConst.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/1.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

/***************************** 常量 *******************************/

let screenW: CGFloat = UIScreen.main.bounds.width
let screenH: CGFloat = UIScreen.main.bounds.height


let isIphoneX = screenH == 812 ? true : false


let navHeight : CGFloat = isIphoneX ? 88 : 64


let statusBarHeight = UIApplication.shared.statusBarFrame.size.height



/***************************** color *******************************/

//背景色
let bgColor =  UIColor.withHex(hexString: "F2F2F2")

//文字   浅灰色  如提示、正文
let k6Color = UIColor.withHex(hexString: "666666")


let k9Color = UIColor.withHex(hexString: "999999")


/***************************** Key *******************************/


//Recommend Photo Index Key
let kRecommendShowPhotoBrowserIndexKey  = "kRecommendShowPhotoBrowserIndexKey"

//Recommend Photo Url Key
let kRecommendShowPhotoBrowserUrlKey  = "kRecommendShowPhotoBrowserUrlKey"




/***************************** Notification *******************************/

//login Success
let kLoginSuccessNotification  = "kLoginSuccessNotification"

// Recommend didSelectItemAt
let kRecommendPhotoSelectItemNotification  = "kRecommendPhotoSelectItemNotification"








