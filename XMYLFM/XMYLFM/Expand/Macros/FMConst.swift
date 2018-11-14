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

let tabBarHeight: CGFloat = (isIphoneX ? 83 : 49)

let statusBarHeight = UIApplication.shared.statusBarFrame.size.height



/***************************** color *******************************/

let kThemeColor = UIColor.withHex(hexString: "E5542A")
//背景色
let kBgColor =  UIColor.withHex(hexString: "F2F2F2")

//文字   浅灰色  如提示、正文
let k6Color = UIColor.withHex(hexString: "666666")

let k9Color = UIColor.withHex(hexString: "999999")

let kB2Color = UIColor.withHex(hexString: "B2B2B2")



let UserDataFilePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/userAccount.plist"


//按钮的背景颜色
let kBtnBgColor = UIColor.withHex(hexString: "FFE4E1")
/***************************** Key *******************************/


let kLoginStatus = "kLoginStatus";

//Recommend Photo Index Key
let kRecommendShowPhotoBrowserIndexKey  = "kRecommendShowPhotoBrowserIndexKey"

//Recommend Photo Url Key
let kRecommendShowPhotoBrowserUrlKey  = "kRecommendShowPhotoBrowserUrlKey"




/***************************** Notification *******************************/

//login Success
let kLoginSuccessNotification  = "kLoginSuccessNotification"


//logOut
let kLogOutNotification  = "kLogOutNotification"

// Recommend didSelectItemAt
let kRecommendPhotoSelectItemNotification  = "kRecommendPhotoSelectItemNotification"








