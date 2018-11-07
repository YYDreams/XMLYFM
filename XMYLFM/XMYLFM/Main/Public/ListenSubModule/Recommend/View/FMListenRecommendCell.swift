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
        
        return titleLabel
    }()
    //subtitle
    private lazy var subTitleLabel: UILabel = {
        
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textColor = k6Color
        
        return subTitleLabel
        
    }()
    //底部View
    private lazy var bottomView: UIView = {
        
        let bottomView = UIView()
        
        return bottomView
    }()
    //播放img
    private lazy var playImgView: UIImageView = {
        
        let playImgView = UIImageView(image: UIImage(named: "playcount"))

        return playImgView
    }()
    
    //播放次数
    private lazy var playsCountsLabel: UILabel = {
        
        let playsCountsLabel = UILabel()
        playsCountsLabel.font = UIFont.boldSystemFont(ofSize: 10)
        playsCountsLabel.textColor = k6Color
        return playsCountsLabel
    }()
    
    
    //听img
    private lazy var tracksImgView: UIImageView = {
        
        let tracksImgView = UIImageView(image: UIImage(named: "track"))
        
        return tracksImgView
    }()
    
    //级数
    private lazy var tracksLabel: UILabel = {
        
        let tracksLabel = UILabel()
        tracksLabel.font = UIFont.boldSystemFont(ofSize: 10)
        tracksLabel.textColor = k6Color
        return tracksLabel
    }()
    
    //订阅按钮
    private lazy var btn: UIButton = {
        
        let btn = UIButton()
        
        btn.setTitle("+订阅", for: .normal)
        btn.setTitleColor(kThemeColor, for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return  btn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var model: FMListRecommedModel? {
        
        didSet{
            
            guard let model = model else {
                return
            }
            
            imgView.sd_setImage(with: URL(string: model.coverMiddle!), placeholderImage: UIImage(named: ""))
            titleLabel.text  = model.title
            subTitleLabel.text = model.recReason
            
            playsCountsLabel.text = "\(model.playsCounts)"
            
            tracksLabel.text = "\(model.tracks)集"
            
        }
        
    }
    
    
    private func setupSubView(){
        
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(bottomView)
        
        bottomView.addSubview(playImgView)
        bottomView.addSubview(playsCountsLabel)
        bottomView.addSubview(tracksImgView)
        bottomView.addSubview(tracksLabel)
        addSubview(btn)
        imgView.snp.makeConstraints { (make) in
            
            make.left.equalTo(15)
            make.width.height.equalTo(80)
            make.centerY.equalToSuperview()
            
        }

        titleLabel.snp.makeConstraints { (make) in

            make.top.equalTo(imgView.snp.top).offset(5)
            make.left.equalTo(imgView.snp.right).offset(10)
            
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        playImgView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.height.width.equalTo(10)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
        playsCountsLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(playImgView.snp.right)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
        tracksImgView.snp.makeConstraints { (make) in
            make.left.equalTo(playsCountsLabel.snp.right).offset(20)
            make.height.width.equalTo(10)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
        tracksLabel.snp.makeConstraints { (make) in
            make.left.equalTo(tracksImgView.snp.right)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
        
        btn.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.height.equalTo(30)
            make.width.equalTo(60)
            make.bottom.equalTo(imgView.snp.bottom)
            
        }
        
        
    }
    
    

}
