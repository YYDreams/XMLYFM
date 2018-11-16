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
    // imageView
   private lazy var imageView: UIImageView = {
        
        let imageView = UIImageView(frame: self.view.bounds)
        
        imageView.contentMode = .scaleAspectFill
        
        return  imageView
    }()
    
    //引导页 按钮
    lazy var skipBtn:UIButton = {
        
        let skipBtn = UIButton(frame: CGRect(x: screenW - 60 - 24 , y: 30, width: 60, height: 30))
        skipBtn.backgroundColor = UIColor.red
        skipBtn.backgroundColor = kThemeColor
        skipBtn.setTitle("跳过", for: .normal)
        skipBtn.layer.cornerRadius = 8
        skipBtn.layer.masksToBounds = true
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

        
        view.addSubview(imageView)
        view.addSubview(skipBtn)
        loadDataFormNetwork()
        
   
        
    }


    private func loadDataFormNetwork(){

        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_ADSE, urlString: kAdseUrl, parameters: [:]) { (result, error) in
            
            
            if error != nil {
                return
            }
            
            guard let resultDic = result as? [String: AnyObject] else {return}
            
            guard let resultDataArr =  resultDic["data"] as? [[String: AnyObject]] else {return}
            
            if let modelX = [FMHomeRecommendHeaderModel].deserialize(from: resultDataArr){
                modelX.forEach({ (model) in
                    guard let cover = model?.cover else {return}
                    self.dataArr.append(cover)
                    
                })
            }
            //等同于上面
//            for data  in resultDataArr {
//                let adModel: FMHomeRecommendHeaderModel = FMHomeRecommendHeaderModel.deserialize(from: data)!
//                guard let cover = adModel.cover else {return}
//                self.dataArr.append(cover)
//
//            }
            
            guard let cover = self.dataArr[0] as? String else{ return }
            
            
            self.imageView.sd_setImage(with: URL(string: cover))

            
        }
        
    }
    
    
    
    
    
}



