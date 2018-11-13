//
//  FMHomeTableViewCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/13.
//  Copyright © 2018 flowerflower. All rights reserved.
//

import UIKit

class FMHomeTableViewCell: BaseCell {


    private lazy var topView: UIView = {

        return UIView()
    }()
    
     lazy var categoryLabel: UILabel = {
        
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        return categoryLabel
    }()
    
    //订阅按钮
    private lazy var btn: UIButton = {
        
        let btn = UIButton()
        btn.titleLabel?.text = "x"
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1.0;
        btn.layer.borderColor = kBgColor.cgColor

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return  btn
    }()
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
    //数量View
    private lazy var countView: UIView = {
        
        let countView = UIView()
        
        return countView
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
    
  
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var model: FMHomeAlbumModel? {
        
        didSet{
            
            guard let model = model else {
                return
            }
       
     
            imgView.sd_setImage(with: URL(string: model.coverPath!), placeholderImage: UIImage(named: ""))
            titleLabel.text  = model.title
            subTitleLabel.text = model.intro
            
            
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
        
    

}


extension FMHomeTableViewCell{
    
    
    private func setupSubView(){
        
        addSubview(topView)
        topView.addSubview(categoryLabel)
        topView.addSubview(btn)
        
   
        addSubview(bottomView)
        bottomView.addSubview(titleLabel)
        bottomView.addSubview(subTitleLabel)
        bottomView.addSubview(imgView)
        bottomView.addSubview(countView)
        
        countView.addSubview(playImgView)
        countView.addSubview(playsCountsLabel)
        countView.addSubview(tracksImgView)
        countView.addSubview(tracksLabel)
        
        topView.snp.makeConstraints { (make) in
            
            make.left.top.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        categoryLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(15)
            make.centerY.equalTo(topView.snp.centerY)
        }
        imgView.snp.makeConstraints { (make) in

            make.right.equalTo(-15)
            make.width.height.equalTo(80)
            make.top.equalTo(topView.snp.bottom)

        }
        
        
        bottomView.snp.makeConstraints { (make) in
            
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
            }
        
          titleLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(bottomView.snp.top).offset(5)
            make.left.equalTo(bottomView.snp.left).offset(10)
            make.right.equalTo(imgView.snp.left).offset(-15)
            
            
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.right.equalTo(titleLabel.snp.right)
        }
        
        
        countView.snp.makeConstraints { (make) in
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
            make.centerY.equalTo(topView.snp.centerY)
            
            
        }
        
        
    }
    
}



