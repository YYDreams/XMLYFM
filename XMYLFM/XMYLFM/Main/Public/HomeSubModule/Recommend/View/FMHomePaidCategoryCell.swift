//
//  FMHomePaidCategoryCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/14.
//  Copyright © 2018年 flowerflower. All rights reserved.
//精品

import UIKit

class FMHomePaidCategoryCell: FMHomeBaseCell {
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.register(FMHomePaidCategoryCollectionCell.self, forCellWithReuseIdentifier: "FMHomePaidCategoryCollectionCellID")
        layout.itemSize = CGSize(width: (screenW - 45)/3, height:150)
        layout.scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArr:[FMHomePaidCategoryModel] = [FMHomePaidCategoryModel]() {
        
        didSet{
            self.collectionView.reloadData()
        }
        
        
    }

    

}

extension FMHomePaidCategoryCell{
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FMHomePaidCategoryCollectionCellID", for: indexPath) as! FMHomePaidCategoryCollectionCell
        cell.model = self.dataArr[indexPath.row]
        return cell
    }
    
    
    
}

class FMHomePaidCategoryCollectionCell: UICollectionViewCell {
    
    
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
    
    //精品label
    private lazy var  moduleLabel: UILabel = {
        
        let moduleLabel = UILabel()
        moduleLabel.font = UIFont.systemFont(ofSize: 8)
        moduleLabel.textColor = UIColor.white
        moduleLabel.backgroundColor = kThemeColor
        moduleLabel.text = "精品"
        return moduleLabel
    }()
    
    //title
    private lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 2
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
        label.textColor = k6Color
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var model: FMHomePaidCategoryModel? {
        
        didSet{
            
            guard let model = model else {
                return
            }
            
            
            imgView.sd_setImage(with: URL(string: model.pic!), placeholderImage: UIImage(named: ""))
            titleLabel.text  = model.title
            
            
            var  playsCounts: String?
            if model.playsCount > 100000000 {
                
                playsCounts = String(format: "%.1f亿", Double(model.playsCount)/100000000)
                
            }else if (model.playsCount > 10000 ){
                
                playsCounts = String(format: "%.1f万", Double(model.playsCount)/10000)
                
                
            }else{
                playsCounts = "\(model.playsCount)"
            }
            
            playLabel.text = playsCounts
        }
        
    }
    
    
    
}

extension FMHomePaidCategoryCollectionCell{
    
    private func setupSubView(){
        
        
        addSubview(bgView)
        bgView.addSubview(imgView)
        bgView.addSubview(moduleLabel)
        bgView.addSubview(titleLabel)
        bgView.addSubview(playImgView)
        bgView.addSubview(playLabel)
        
        
        bgView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        

        imgView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(bgView.snp.bottom).offset(-40)
            
        }
        moduleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(bgView)
            make.height.equalTo(15)
            
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bgView.snp.left)
            make.right.equalTo(bgView.snp.right)
            make.top.equalTo(imgView.snp.bottom)
        }
        playImgView.snp.makeConstraints { (make) in
            make.left.equalTo(bgView.snp.left).offset(5)
            make.height.width.equalTo(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        playLabel.snp.makeConstraints { (make) in
            make.left.equalTo(playImgView.snp.right)
            make.top.equalTo(playImgView.snp.top)
            
        }

        
    }
    
    
    
}
