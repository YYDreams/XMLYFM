//
//  DiscoverHeaderCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/2.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import SnapKit
class DiscoverHeaderCell: UICollectionViewCell {
    
    
    private lazy var  imageView:  UIImageView = {

        return  UIImageView()
    }()
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
    
        label.font = UIFont.systemFont(ofSize: 13)
        
        label.textAlignment = .center
        
        return label
    }()
    
    
    var square:DiscoverModel?{
        
        didSet{
            
            guard let square = square else {
             
                 return
            }
            
            let url = URL(string: square.coverPath ?? "")
            
            imageView.sd_setImage(with: url, placeholderImage:  UIImage(named:"empty_picture"))
            
            titleLabel.text = square.title
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
        
        
        addSubview(titleLabel)
        
        
        
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
    
        }
        
        titleLabel.snp.makeConstraints { (make) in
            
            make.left.right.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.height.equalTo(20)
        }
        
    }
    
    
}
