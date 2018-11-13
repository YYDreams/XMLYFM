//
//  FMHomeModuleCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/13.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHomeModuleCell: BaseCell {

    
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5 //列间隙
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        
        layout.itemSize = CGSize(width: (screenW - 45)/3, height:(screenW - 120)/2.0)
        let collectionView = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FMHomeModuleCollectionCell.self, forCellWithReuseIdentifier: "FMHomeModuleCollectionCellID")
        return collectionView
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubView()
        
    }
    var dataArr:[FMHotSearchListModel] = [FMHotSearchListModel](){
        
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension  FMHomeModuleCell{
    
    private func setupSubView(){
        
        addSubview(collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            
            make.top.left.right.bottom.equalToSuperview()
        }
        print("==================collection\(collectionView.frame)")
    }
    
}

extension FMHomeModuleCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FMHomeModuleCollectionCellID", for: indexPath) as! FMHomeModuleCollectionCell
//        cell.model = self.dataArr[indexPath.row]
        return cell
    }

}



class FMHomeModuleCollectionCell: UICollectionViewCell {
    
    
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
        label.font = UIFont.systemFont(ofSize: 13)
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
    
    
 
    
}

extension FMHomeModuleCollectionCell{
    
    private func  setupSubView(){
        
        addSubview(bgView)
        bgView.addSubview(imgView)
        bgView.addSubview(moduleLabel)
        bgView.addSubview(titleLabel)
        bgView.addSubview(playImgView)
        bgView.addSubview(playLabel)
        
//        imgView.backgroundColor = UIColor.red
//        moduleLabel.backgroundColor = UIColor.gray
//        titleLabel.backgroundColor = UIColor.green
//        titleLabel.text = "dsdssee"
//        playLabel.text = "111dsdssee"
//        playImgView.backgroundColor = UIColor.orange
//        playLabel.backgroundColor = UIColor.yellow
        bgView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }

        print("==1111111111111====\(bgView.frame)")
        imgView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
//            make.bottom.equalTo(titleLabel.snp.top)
             make.height.equalTo(55)

        }
        moduleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(bgView)
            make.height.equalTo(15)
            make.width.equalTo(50)

        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bgView.snp.left)
            make.right.equalTo(bgView.snp.right)
            make.bottom.equalTo(playImgView.snp.top).offset(-2)
        }


        playLabel.snp.makeConstraints { (make) in
            make.left.equalTo(playImgView.snp.right)
            make.bottom.equalTo(bgView.snp.bottom).offset(-3)

        }
        playImgView.snp.makeConstraints { (make) in
            make.left.equalTo(bgView.snp.left).offset(5)
            make.height.width.equalTo(10)
            make.bottom.equalTo(bgView.snp.bottom).offset(-3)
        }
        
        
    }
    
}

