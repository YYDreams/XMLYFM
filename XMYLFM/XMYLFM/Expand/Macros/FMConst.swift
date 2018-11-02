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

let bgColor =  UIColor.withHex(hexString: "F2F2F2")


/***************************** Notification *******************************/

//login Success
let kLoginSuccessNotification  = "kLoginSuccessNotification"


