//
//  NSDate+Extension.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/6.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit


public extension NSDate{
    
    //MARK: -时间戳转时间函数
   class func timeStampToString(timeStamp: Double, outputFormatter: String?)->String {
    
        let timeString = String.init(format: "%d", timeStamp)
    
     //  时间戳为毫秒级要／1000 (13位数)， 秒就不用除1000（10位数），参数带没带000
      let timeSta:TimeInterval  =  (timeString.count == 10) ? TimeInterval(timeStamp) : TimeInterval(timeStamp / 1000)
   
        let date = NSDate(timeIntervalSince1970: timeSta)
    
        let dfmatter = DateFormatter()
    dfmatter.dateFormat = outputFormatter ?? "yyyy年MM月dd日 HH:mm"
    
    return (dfmatter.string(from: date as Date) as NSString) as String

    }
    

    //MARK: -根据后台时间戳返回几分钟前，几小时前，几天前
  class  func updateTimeToCurrennTime(timeStamp: Double,outputFormatter: String?) -> String {
    
    let timeString = String.init(format: "%d", timeStamp)

        //获取当前的时间戳
        let currentTime = Date().timeIntervalSince1970
    
        //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
      let timeSta:TimeInterval  =  (timeString.count == 10) ? TimeInterval(timeStamp) : TimeInterval(timeStamp / 1000)

        //时间差
        let reduceTime : TimeInterval = currentTime - timeSta
        //时间差小于60秒
        if reduceTime < 60 {
            return "刚刚"
        }
        //时间差大于一分钟小于60分钟内
        let mins = Int(reduceTime / 60)
        if mins < 60 {
            return "\(mins)分钟前"
        }
        let hours = Int(reduceTime / 3600)
        if hours < 24 {
            return "\(hours)小时前"
        }
        let days = Int(reduceTime / 3600 / 24)
        if days < 30 {
            return "\(days)天前"
        }
        //不满足上述条件---或者是未来日期-----直接返回日期
        let date = NSDate(timeIntervalSince1970: timeSta)
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
       dfmatter.dateFormat = outputFormatter ?? "yyyy年MM月dd日 HH:mm"

        return dfmatter.string(from: date as Date)
    }
    
    
    
   
    
}




