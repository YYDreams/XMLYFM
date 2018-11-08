//
//  FMListenRecommendCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/7.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
//订阅cell与推荐cell 共用 FMListenRecommendCell
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
    //订阅cell里面的时间
    private lazy var lastUpdateAtLabel: UILabel = {
        
        let lastUpdateAtLabel = UILabel()
        lastUpdateAtLabel.font = UIFont.boldSystemFont(ofSize: 10)
        lastUpdateAtLabel.textColor = k6Color
        lastUpdateAtLabel.isHidden = true
        return lastUpdateAtLabel
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
        

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return  btn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
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
            btn.setTitle("+订阅", for: .normal)
            btn.setTitleColor(kThemeColor, for: .normal)
            btn.backgroundColor = kBtnBgColor
            btn.layer.cornerRadius = 10
            btn.layer.masksToBounds = true
            
            
            imgView.sd_setImage(with: URL(string: model.coverMiddle!), placeholderImage: UIImage(named: ""))
            titleLabel.text  = model.title
            subTitleLabel.text = model.recReason
                        
            
            var  playsCounts: String?
            if model.playsCounts > 100000000 {
                
             playsCounts = String(format: "%.1f亿", Double(model.playsCounts)/100000000)
                
            }else if (model.playsCounts > 10000 ){
                
             playsCounts = String(format: "%.1f万", Double(model.playsCounts)/10000)
        

            }else{
                playsCounts = "\(model.playsCounts)"
            }
            
            playsCountsLabel.text = playsCounts
            
            tracksLabel.text = "\(model.tracks)集"
            
        }
        
    }
    
    var subscribeModel: FMSubscribeModel? {
        
        didSet{
            
            guard let subscribeModel = subscribeModel else {
                return
            }
            bottomView.isHidden = true
            lastUpdateAtLabel.isHidden = false
            
            btn.setTitle("...", for: .normal)
            btn.setTitleColor(k6Color, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)

            btn.snp.updateConstraints { (make) in
                make.right.equalTo(5)
            }
            
            imgView.sd_setImage(with: URL(string: subscribeModel.albumCover!), placeholderImage: UIImage(named: ""))
            titleLabel.text  = subscribeModel.albumTitle
            subTitleLabel.text = subscribeModel.trackTitle
            lastUpdateAtLabel.text = NSDate.updateTimeToCurrennTime(timeStamp: subscribeModel.lastUpdateAt,outputFormatter: "yyyy-MM")
        }
        
        
        
    }
    
    
    private func setupSubView(){
        
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(bottomView)
        
        addSubview(lastUpdateAtLabel)
        
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
            make.right.equalTo(-10)
        }
        
        lastUpdateAtLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(10)
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
            make.height.equalTo(25)
            make.width.equalTo(45)
            make.bottom.equalTo(imgView.snp.bottom)
            
        }
        
        
    }
    
    

}
