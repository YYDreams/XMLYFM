//
//  DiscoverViewModel.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/2.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class DiscoverViewModel: NSObject {

    
    var recommendModel: FMRecommendModel?
    
    var picUrls: [NSURL] = [NSURL]()
    var createTime:String?  //处理创建时间
    var cellHeight: CGFloat = 0

    
    init(recommend: FMRecommendModel) {
        
        
        self.recommendModel = recommend
      
       createTime  =  NSDate.timeStampToString(timeStamp: recommend.issuedTs, outputFormatter: nil)
        
        if recommend.picUrls?.count != 0 {
            
            if let picUrlDict = recommend.picUrls {
                
                for picUrlDic  in  picUrlDict{
                    
                    guard  let picUrlStr = picUrlDic["thumbnailUrl"] else {
                        
                        continue
                        
                    }
                    
                    //到这步是一定有值的  可以强制解包
                    picUrls.append(NSURL(string:picUrlStr)!)
                    
                }
                
            }
        }
        
      

   }

}



extension DiscoverViewModel{
 
    //MARK: 推荐数据请求接口
    //result:[[String :AnyObject]]?
    
    class func loadRecommendDataFormNetwork(findished:@escaping ( _ result:DiscoverViewModel? ,_ error: Error?)->()){
        
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_MOCKY, urlString: kDiscoverRecommendUrl, parameters: [:]) { (result, error) in
            
            if error != nil {
                return
            }

            guard let resultDic  = result as? [String : AnyObject] else{
                findished(nil,error)
                return
            }
            guard let resultData  = resultDic["data"] as? [String : AnyObject] else{
                
                findished(nil,error)
                return
            }
            
            guard  let resultArr = resultData["streamList"] as? [[String:AnyObject]]  else {
                
                return
            }
            for streamList in resultArr {

                let streamListModel:FMRecommendModel = FMRecommendModel.deserialize(from: streamList)!

                let viewModel = DiscoverViewModel(recommend: streamListModel)

          
                print(viewModel.picUrls)

                findished(viewModel,error)
                
            }
            
//            findished(resultData["streamList"] as? [[String:AnyObject]],error)

        }
        
        
    }

}

