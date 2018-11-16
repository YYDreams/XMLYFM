//
//  NetworkTool.swift
//  WB
//
//  Created by flowerflower on 2018/9/21.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import Foundation
import AFNetworking
enum HTTPMethod {
    case GET
    case POST
}

class NetworkTool: AFHTTPSessionManager{
    
    //let 是线程安全的
    static let instance: NetworkTool = {

       let tool = NetworkTool()

        tool.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json","text/html", "text/javascript","text/plain") as? Set<String>
        
        return tool
    }()
    
    class func shareNetworkTool() -> NetworkTool {
        
        return instance
    }


}

// MARK:- 网络请求的封装
extension NetworkTool {
    
    // [String : AnyObject] 字典类型的写法
    func request(methodType : HTTPMethod , baseUrl : String, urlString : String, parameters: [String: AnyObject], finished : @escaping (_ result : Any?, _ error : Error?) -> ()) {

        let url = baseUrl + urlString
       
        print("url-----------\(url)")
        // 1.封装成功的回调
        let successCallBack = { (task : URLSessionDataTask, result : Any?) -> Void in
            finished(result, nil)
        }
        
        // 2.封装失败的回调
        let failureCallBack = { (task : URLSessionDataTask?, error : Error) -> Void in
            finished(nil, error)
        }
        
        // 3.发送网络请求
        if methodType == .GET {
            
            get(url, parameters: parameters, progress: nil, success: successCallBack , failure: failureCallBack)
        } else {
            
            post(url, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
        
    }
}

