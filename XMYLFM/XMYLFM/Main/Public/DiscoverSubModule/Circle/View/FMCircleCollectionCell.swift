//
//  FMCircleCollectionCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMCircleCollectionCell: UICollectionViewCell {
    
    
    // contenView
    private lazy var contenView: UIView = {
       
        let contenView = UIView()
        
        return contenView
    }()

    // imageView
    private lazy var imageView: UIImageView = {
        
        return  UIImageView()

        
    }()
    
    // nameLabel
    private lazy var nameLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 13)
        
        label.textAlignment = .center
        
        return label
    }()
    
    //memberCountLabel
    
    private lazy var memberCountLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = k6Color
        label.textAlignment = .center
        
        return label
    }()
    
    // + join Button
    private lazy var joinButton: UIButton = {
        
        let joinButton = UIButton()
        
        joinButton.setTitle("+ 加入", for: .normal)
        joinButton.setTitleColor(UIColor.red, for: .normal)
        joinButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        joinButton.backgroundColor = UIColor.withHex(hexString: "FFC0CB")
        joinButton.layer.masksToBounds = true
        joinButton.layer.cornerRadius = 10
        return joinButton
    }()
    
    
    
    
    var model: FMCircleModel? {
        
        
        didSet{
            
            guard let model = model else{
                return
            }
            
            nameLabel.text = model.name
            memberCountLabel.text = "成员:\(model.memberCount)"
            let url = URL(string: model.logo ?? "")
            imageView.sd_setImage(with: url, placeholderImage:  UIImage(named:"empty_picture"))
            
            
            
            
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
        
        
        addSubview(contenView)
        
        contenView.addSubview(imageView)
        contenView.addSubview(nameLabel)
        contenView.addSubview(memberCountLabel)
        contenView.addSubview(joinButton)
        
        
        
        contenView.layer.masksToBounds = true
        contenView.layer.cornerRadius = 8
        contenView.layer.borderWidth = 1.0;
        contenView.layer.borderColor = bgColor.cgColor
        
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        contenView.snp.makeConstraints { (make) in
            
            make.left.right.top.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            
        }
        
        nameLabel.snp.makeConstraints { (make) in
            
            make.left.right.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.height.equalTo(15)
        }
        
        memberCountLabel.snp.makeConstraints { (make) in
            
            make.left.right.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.height.equalTo(15)
        }
        
        joinButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(memberCountLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
             make.width.equalTo(60)
        }
        
        
    }
    
}
