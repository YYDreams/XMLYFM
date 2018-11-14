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

/****************首页******************/
//首页tab数据   显示推荐 vip 小说 直播等等
let kHomeTabsUrl = "/v2/5be3dc6a2f00004e00d9f199"

//轮播图 collectionView中的(经典必听、每日必听等等)   喜马热搜榜 ≈
//let kHomeAllUrl = "/discovery-feed/v2/mix/ts-1541659816686?appid=0&scale=2&uid=0&version=6.5.24&channel=ios-b1&deviceId=BBB40C91-2640-4EFE-BDEA-3368D6BE4B43&xt=1541659816686&traitKey=&onlyBody=false&offset=15&operator=3&traitValue=&network=WIFI&code=43_440000_4403&device=iPhone&categoryId=-2"

//跟上面的区别在于 这个接口有 精品和懒人一键听的数据 而上面的接口有返回喜马热搜榜 注意 这个的前缀是MAIN_URL_6 上面的是MAIN_URL
let kHomeAllUrl = "/discovery-feed/v2/mix/ts-1541755553738?appid=0&scale=2&uid=0&version=6.5.24&channel=ios-b1&deviceId=BBB40C91-2640-4EFE-BDEA-3368D6BE4B43&xt=1541755553739&traitKey=&onlyBody=false&offset=0&operator=3&traitValue=&network=WIFI&code=43_440000_4403&device=iPhone&categoryId=-2"

//http://mobile.ximalaya.com/discovery-feed/v2/mix/ts-1541659816686?appid=0&scale=2&uid=0&version=6.5.24&channel=ios-b1&deviceId=BBB40C91-2640-4EFE-BDEA-3368D6BE4B43&xt=1541659816686&traitKey=&onlyBody=false&offset=15&operator=3&traitValue=&network=WIFI&code=43_440000_4403&device=iPhone&categoryId=-2
//http://180.153.255.6/discovery-feed/v2/mix/ts-1541755553738?appid=0&scale=2&uid=0&version=6.5.24&channel=ios-b1&deviceId=BBB40C91-2640-4EFE-BDEA-3368D6BE4B43&xt=1541755553739&traitKey=&onlyBody=false&offset=0&operator=3&traitValue=&network=WIFI&code=43_440000_4403&device=iPhone&categoryId=-2

//猜你喜欢
//&pageId=1&pageSize=20 当前页码和一页加载的数量 做上拉和下拉需要 则这里拿出来 到时网络请求时拼接
let kHomeguessYouLike = "/discovery-firstpage/guessYouLike/list/ts-1541660622723?appid=0&device=iPhone&deviceId=BBB40C91-2640-4EFE-BDEA-3368D6BE4B43&inreview=false&network=WIFI&operator=3&scale=2&uid=0&version=6.5.24&xt=1541660622724"
//http://mobile.ximalaya.com/discovery-firstpage/guessYouLike/list/ts-1541660622723?appid=0&device=iPhone&deviceId=BBB40C91-2640-4EFE-BDEA-3368D6BE4B43&inreview=false&network=WIFI&operator=3&pageId=1&pageSize=20&scale=2&uid=0&version=6.5.24&xt=1541660622724


/****************我听******************/
//订阅
let kDiscoverySubscribeUrl = "/v2/5be395ac2f00006b00d9f0ea"

//一键听
let kOnetListenUrl = "/radio-station/v1/subscribe-channel/list?pageId=1"
//http://mobile.ximalaya.com/radio-station/v1/subscribe-channel/list?pageId=1
//推荐
let kListenSubscribeUrl = "/subscribe/v2/subscribe/recommend/unlogin"
//http://180.153.255.6/subscribe/v2/subscribe/recommend/unlogin?device=iPhone&pageId=1&pageSize=30

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


