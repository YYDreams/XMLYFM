//
//  FMPicCollectionViewCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/6.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMPicCollectionViewCell: UICollectionViewCell {

    
    
    var  finishBtnClickCallBack: (() -> Void)?
    // imageView
     lazy var imageView: UIImageView = {
        
         let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill

        return  imageView
    }()
    
    
    //引导页 按钮
    lazy var finishBtn:UIButton = {
       
        let finishBtn = UIButton(frame: CGRect(x: (screenW - 100) * 0.5, y: screenH - 100, width: 100, height: 40))
        
        finishBtn.backgroundColor = kThemeColor
        finishBtn.setTitle("立即体验", for: .normal)
        finishBtn.layer.cornerRadius = 8
        finishBtn.layer.masksToBounds = true
        finishBtn.addTarget(self, action: #selector(finishOnClick), for: .touchUpInside)
        finishBtn.isHidden = true
        return finishBtn
    }()
    
    
    
    
    var picUrl: NSURL?{
        didSet{
            guard let picUrl = picUrl else {
                
                return
            }
            
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 8
            
            imageView.sd_setImage(with: picUrl as URL, placeholderImage:  UIImage(named:"empty_picture"))
            
        }
        
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubView()
        
    }
    
    
    func setFinishBtnHidden(hidden: Bool) {
        finishBtn.isHidden = hidden
    }
    @objc private func finishOnClick(){
        
        if finishBtnClickCallBack != nil {
            finishBtnClickCallBack!()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupSubView(){
        
        
        addSubview(imageView)
        
        //引导页
        addSubview(finishBtn)
        
        

        imageView.snp.makeConstraints { (make) in
            
            make.left.right.top.bottom.equalToSuperview()
        }
        
     
    }
    
    
}


    

