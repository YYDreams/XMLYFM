//
//  FMPicCollectionViewCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/6.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMPicCollectionViewCell: UICollectionViewCell {

    // imageView
     lazy var imageView: UIImageView = {
        
        return  UIImageView()
        
        
    }()
    
    
    
    
    var picUrl: NSURL?{
        didSet{
            guard let picUrl = picUrl else {
                
                return
            }
            
            imageView.sd_setImage(with: picUrl as URL, placeholderImage:  UIImage(named:"empty_picture"))
            
        }
        
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupSubView(){
        
        
        addSubview(imageView)
        

        
        

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.snp.makeConstraints { (make) in
            
            make.left.right.top.bottom.equalToSuperview()
        }
        
     
    }
    
    
}


    

