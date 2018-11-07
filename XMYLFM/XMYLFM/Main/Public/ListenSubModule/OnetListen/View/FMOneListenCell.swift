//
//  FMOneListenCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/7.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMOneListenCell: BaseCell {


    
    //背景
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
    
    //播放按钮
    private lazy var playBtn: UIButton = {
       
        let playBtn = UIButton()
        playBtn.setImage(UIImage(named: "whitePlay"), for: UIControlState.normal)

        return  playBtn
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var oneListModel: FMOneListenModel? {
        
        
        
        
        didSet{
            
            
            
            guard let oneListModel = oneListModel else {
                return
            }
            
            imgView.sd_setImage(with: URL(string: oneListModel.bigCover!), placeholderImage:UIImage(named: "") )
            titleLabel.text = oneListModel.channelName
            subTitleLabel.text = oneListModel.slogan
            
            if oneListModel.cellHeight == 0 {
                
                
            }
            
            
        }
        
    }
    
    
    private func setupSubView(){
        
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(playBtn)
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(15)
             make.right.equalTo(-15)
              make.bottom.equalTo(-10)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.left).offset(20)
            make.top.equalTo(imgView.snp.top).offset(20)
            make.height.equalTo(20)
            
        }
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(20)
            
        }
        
        playBtn.snp.makeConstraints { (make) in
            
            make.height.width.equalTo(40)
            make.right.equalTo(imgView.snp.right).offset(-10)
            make.bottom.equalTo(-20)
            
        }
        
        

        
        
        
    }
    
    

}
