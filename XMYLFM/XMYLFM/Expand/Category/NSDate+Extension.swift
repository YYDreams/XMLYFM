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
    

    
    
    
    /**
     传 str 返回 NSDate
     */
    
    //    class func dateWithStr(time: String) -> NSDate{
    //
    //
    //        //1.1 创建时间格式化对象
    //        let formatter = DateFormatter()
    //        //1.2 设置时间格式
    //        formatter.dateFormat  = "EEE MM dd HH:mm:ss Z yyyy"
    //        // 1.3 设置时间的区域(真机必须设置，负责可能转化不成功)
    //        formatter.locale = Locale(identifier: "en")
    //        // 1.4.转化字符串，转化好的字符串是去除时区的时间
    //        let createDate = formatter.date(from: time)
    //
    //        return createDate!  as NSDate
    //
    //
    //    }
    
    /*
     * 刚刚(一分钟以内)
     * X分钟以前（1个小时以内）
     * X小时前（当天）
     * 昨天 HH:mm(昨天)
     * MM-dd HH-mm (一年内)
     * yyyy-MM-dd HH:mm (更早时间)
     */
    
    class func dateWithStr(time: String)-> NSString{
        
        
        //1.1 创建时间格式化对象
        let formatter = DateFormatter()
        //1.2 设置时间格式
        formatter.dateFormat  = "EEE MM dd HH:mm:ss Z yyyy"
        // 1.3 设置时间的区域(真机必须设置，负责可能转化不成功)
        formatter.locale = Locale(identifier: "en")
        // 1.4.转化字符串，转化好的字符串是去除时区的时间
        let date = formatter.date(from: time)
        
        // 2 创建日历对象
        let calendar = NSCalendar.current
        //2.1 判断是否为今天
        
        if calendar.isDateInToday(date!){
            
            let since = Int(NSDate().timeIntervalSince(date!))
            
            
            if  since < 60 {
                
                return "刚刚"
            }
            
            // 2.1.1多少分钟以前
            if since < 60 * 60{
                return "\(since/60)分钟前" as NSString
            }
            // 2.1.2 多少小时以前
            return "\(since/(60 * 60))小时前" as NSString
            
        }
        
        //2.2 判断是否是昨天
        
        var formatterStr = "HH:mm"
        if calendar.isDateInYesterday(date!) {
            
            // 昨天
            formatterStr = "昨天:" + formatterStr
            
        }else{
            
            // 取到当前时间
            let currentDate = NSDate()
            // 初始化时间格式化器
            let df = DateFormatter()
            // 指定格式
            df.dateFormat = "yyyy"
            // 格式当前时间与目标时间成字符串
            let currentDateString = df.string(from: currentDate as Date)
            let dateString = df.string(from: date!)
            
            //2.3 判断是不是今年
            if (currentDateString as NSString).isEqual(to: dateString)
            {
                // 2.3.1 是今年    处理一年以内
                //
                formatterStr = "MM-dd-" + formatterStr
                
            }else{
                
                //  2.3.2 不是今年
                formatterStr = "yyyy-MM-dd-" + formatterStr
            }
            
        }
        // 3.按照指定的格式将时间转化为字符串
        // 3.1.创建formatter
        let formatter1 = DateFormatter()
        // 3.2.设置时间格式
        formatter1.dateFormat = formatterStr
        // 3.3.设置时间的区域(真机必须设置，负责可能转化不成功)
        formatter1.locale = NSLocale(localeIdentifier: "en") as Locale!
        // 3.4.格式化
        return formatter1.string(from: date!) as NSString
    }
    
}




