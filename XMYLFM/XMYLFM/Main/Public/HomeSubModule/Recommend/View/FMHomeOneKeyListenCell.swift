//
//  FMHomeOneKeyListenCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/14.
//  Copyright © 2018年 flowerflower. All rights reserved.
//懒人一键听

import UIKit

class FMHomeOneKeyListenCell: FMHomeBaseCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.register(FMHomeOneKeyListenCollectionCell.self, forCellWithReuseIdentifier: "FMHomeOneKeyListenCollectionCellID")
        layout.itemSize = CGSize(width: (screenW - 120), height:150)
        layout.scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArr:[FMHomeOneKeyListenModel] = [FMHomeOneKeyListenModel]() {
        
        didSet{
            self.collectionView.reloadData()
        }
        
        
    }


}

extension FMHomeOneKeyListenCell{
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FMHomeOneKeyListenCollectionCellID", for: indexPath) as! FMHomeOneKeyListenCollectionCell
        cell.model = self.dataArr[indexPath.row]
        return cell
    }
    
    
    
}

class FMHomeOneKeyListenCollectionCell: UICollectionViewCell {
    
    

    //图片
    private lazy var  imgView: UIImageView = {
        
        let imgView = UIImageView()

        return imgView
    }()
    

    //title
    private lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        titleLabel.textColor = UIColor.white
        
        return titleLabel
    }()
    
    //耳机img
    private lazy var  playImgView: UIImageView = {
        
        return  UIImageView(image: UIImage(named: "playcount"))
        
    }()
    //播放次数Label
    private lazy var playLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var model: FMHomeOneKeyListenModel? {
        
        didSet{
            
            guard let model = model else {
                return
            }
            
            
            imgView.sd_setImage(with: URL(string: model.cover!), placeholderImage: UIImage(named: ""))
            titleLabel.text  = model.channelName
            
            
            var  playsCounts: String?
            if model.onLineNum > 100000000 {
                
                playsCounts = String(format: "%.1f亿人正在听", Double(model.onLineNum)/100000000)
                
            }else if (model.onLineNum > 10000 ){
                
                playsCounts = String(format: "%.1f万人正在听", Double(model.onLineNum)/10000)
                
                
            }else{
                playsCounts = "\(model.onLineNum)人正在听"
            }
            
            playLabel.text = playsCounts
        }
        
    }
    
    
    
}

extension FMHomeOneKeyListenCollectionCell{
    
    private func setupSubView(){
        
   
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(playImgView)
        addSubview(playLabel)

        imgView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        imgView.layer.cornerRadius = 18
        imgView.layer.masksToBounds = true

        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(imgView.snp.right)
            make.centerY.equalTo(imgView.snp.centerY)
        }
     
        
        playLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            
        }
        playImgView.snp.makeConstraints { (make) in
            make.left.equalTo(playLabel.snp.right)
            make.height.width.equalTo(10)
            make.top.equalTo(playLabel.snp.top)
        }
        
        
    }
    
    
    
}
