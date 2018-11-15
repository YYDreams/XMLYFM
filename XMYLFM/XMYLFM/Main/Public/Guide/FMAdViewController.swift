//
//  FMAdViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/15.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMAdViewController: BaseUIViewController {

    
     var skipBtnClickCallBack: (()-> Void)?
    
    private lazy var dataArr:Array = []
    private lazy var imgView: UIImageView = {
        
        let imgView = UIImageView(frame: UIScreen.main.bounds)
//        imgView.backgroundColor = UIColor.yellow
        return imgView
        
    }()
    
    //引导页 按钮
    lazy var skipBtn:UIButton = {
        
        let skipBtn = UIButton(frame: CGRect(x: screenW - 60 - 24 , y: 30, width: 60, height: 30))
        skipBtn.backgroundColor = UIColor.red
        skipBtn.backgroundColor = kThemeColor
        skipBtn.setTitle("跳过", for: .normal)
        skipBtn.addTarget(self, action: #selector(skipOnClick), for: .touchUpInside)
        
        return skipBtn
    }()
    
    
    @objc private func skipOnClick(){
        
        if skipBtnClickCallBack != nil{
            skipBtnClickCallBack!()
            
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(imgView)
        view.addSubview(skipBtn)
        loadDataFormNetwork()
        
   
        
    }

    
 

    
    private func loadDataFormNetwork(){
        
        //
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_ADSE, urlString: kAdseUrl, parameters: [:]) { (result, error) in
            
            
            if error != nil {
                return
            }
            
            guard let resultDic = result as? [String: AnyObject] else {return}
            
            guard let resultDataArr =  resultDic["data"] as? [[String: AnyObject]] else {return}
            
            for data  in resultDataArr {
                
                let adModel: FMHomeRecommendHeaderModel = FMHomeRecommendHeaderModel.deserialize(from: data)!
                
                guard let cover = adModel.cover else {return}
                self.dataArr.append(cover)
                
              
                
                
            }
            let string: String = (self.dataArr[0] as? String)!
            
            
            self.imgView.image = UIImage(named: string)
            
            
              print("cover\(self.dataArr[0])")
            
        }
        
    }
    
    
    
    
    
}



