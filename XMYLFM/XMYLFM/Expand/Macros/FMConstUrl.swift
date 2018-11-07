//
//  FMConstUrl.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/1.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

import Foundation

/**********************************************/
//配置Host
let MAIN_URL_6 = "http://180.153.255.6"
//
let MAIN_URL = "http://mobile.ximalaya.com"

//
let MAIN_URL_MOCKY = "http://www.mocky.io"


let MAIN_URL_M_XMLY = "http://m.ximalaya.com"


/****************我听******************/
//订阅
//let kDiscoveryTabsUrl = "/discovery-stream-mobile/discoveryPage/wholeContent/tabs/ts-1541140247973"

//一键听
let kOnetListenUrl = "/radio-station/v1/subscribe-channel/list?pageId=1"
//http://mobile.ximalaya.com/radio-station/v1/subscribe-channel/list?pageId=1
//推荐
let kListenSubscribeUrl = "/subscribe/v2/subscribe/recommend/unlogin?device=iPhone&pageId=1&pageSize=30"
//http://180.153.255.6/subscribe/v2/subscribe/recommend/unlogin?device=iPhone&pageId=1&pageSize=30
//http://180.153.255.6/subscribe/v2/subscribe/recommend/unlogin?device=iPhone&pageId=2&pageSize=30


/****************发现******************/

//顶部
let kDiscoveryTabsUrl = "/discovery-stream-mobile/discoveryPage/wholeContent/tabs/ts-1541140247973"

//推荐
let kDiscoverRecommendUrl = "/v2/5be12f863000003600d9a831"

//可能感兴趣的圈子
let kDiscoveryCommunityUrl = "/community/v1/communities/recommendations?pageSize=20"
//http://m.ximalaya.com/community/v1/communities/recommendations?pageSize=20


//趣配音
let kDiscoverIntereDubUrl = "/v2/5be0511732000063006495c9"

/****************我的******************/
//个人信息
let kMobileUrl = "/v2/5bdbab503200004e3c3ad5d3"
//积分查询
let kPointQueryUrl = "/v2/5bdbab503200004e3c3ad5d3"
//



/****************登录******************/
let kLoginUrl = "/v2/5bdce8df33000066298136b8"

//退出登录
let kLogoutUrl = "/v2/5bdfa9a8310000891b9e406d"











/********************************************************/


//http://180.153.255.6/passport/token/login
let kPassportTokenLogin = "/passport/token/login"


//POST http://mobile.ximalaya.com/passport-sign-mobile/v3/signin/password
//     http://mobile.ximalaya.com/passport-sign-mobile/v3/signin/password
//密码登录
let kSigninPasswordUrl = "/passport-sign-mobile/v3/signin/password"


//POST http://hybrid.ximalaya.com/api/passport/password/security/reset/mobile/ajaxnew
//修改密码
let kPasswordSecurityResetUrl = "/api/passport/password/security/reset/mobile/ajaxnew"



//let kMobileUrl = "/mobile/homePage/"


//http://180.153.255.6/mobile/v2/point/query
//查询积分
let kMobilePointQueryUrl = "/mobile/v2/point/query"


