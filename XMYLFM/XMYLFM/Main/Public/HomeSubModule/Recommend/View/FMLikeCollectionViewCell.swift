//
//  FMLikeCollectionViewCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/9.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMLikeCollectionViewCell: UICollectionViewCell {
    
    //整个内容View
    private lazy var bgView:UIView = {
        
        return UIView()
    }()
    
    //图片
    private lazy var  imgView: UIImageView = {
        
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 8
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    //播放img
    private lazy var  playImgView: UIImageView = {
        
       return  UIImageView(image: UIImage(named: "playcount"))

    }()
    //播放次数Label
    private lazy var playLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.white
        return label
    }()
    
    
    
    
    //title
    private lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension  FMLikeCollectionViewCell{
    
    private func setupSubView(){
        
        addSubview(bgView)
        bgView.addSubview(imgView)
        bgView.addSubview(playImgView)
        bgView.addSubview(playLabel)
        bgView.addSubview(titleLabel)
        
        imgView.backgroundColor = UIColor.red
        playLabel.text = "xx"
        titleLabel.text = "1111"
        
        
        bgView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top)
            
        }
        playImgView.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.left).offset(5)
            make.height.width.equalTo(10)
            make.bottom.equalTo(imgView.snp.bottom).offset(-3)
        }
        playLabel.snp.makeConstraints { (make) in
            make.left.equalTo(playImgView.snp.right)
          make.bottom.equalTo(imgView.snp.bottom).offset(-3)
            
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.left)
            make.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
        
    }
    
    
}
