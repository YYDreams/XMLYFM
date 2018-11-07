//
//  FMListenRecommendCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/7.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMListenRecommendCell: BaseCell {

    
    
    //img
    private lazy var imgView: UIImageView = {
        
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 8
        imgView.layer.masksToBounds = true
        return imgView
    }()
    

    //title
    private lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.textColor = UIColor.white
        return titleLabel
    }()
    //subtitle
    private lazy var subTitleLabel: UILabel = {
        
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textColor = UIColor.white
        
        return subTitleLabel
        
    }()
    
    //播放img
    private lazy var playImgView: UIImageView = {
        
        let playImgView = UIImageView()

        return playImgView
    }()
    
    //播放次数
    private lazy var playsCountsLabel: UILabel = {
        
        let playsCountsLabel = UILabel()
        playsCountsLabel.font = UIFont.boldSystemFont(ofSize: 10)
        playsCountsLabel.textColor = UIColor.white
        return playsCountsLabel
    }()
    
    
    //听img
    private lazy var listenImgView: UIImageView = {
        
        let listenImgView = UIImageView()
        
        return listenImgView
    }()
    
    //级数
    private lazy var tracksLabel: UILabel = {
        
        let tracksLabel = UILabel()
        tracksLabel.font = UIFont.boldSystemFont(ofSize: 10)
        tracksLabel.textColor = UIColor.white
        return tracksLabel
    }()
    
    //订阅按钮
    private lazy var btn: UIButton = {
        
        let btn = UIButton()
        
        btn.setTitle("+订阅", for: .normal)
        btn.setTitleColor(kThemeColor, for: .normal)
        btn.backgroundColor = UIColor.blue
        return  btn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupSubView(){
        
        
        
    }
    
    

}
