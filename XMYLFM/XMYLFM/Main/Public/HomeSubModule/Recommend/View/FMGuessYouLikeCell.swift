//
//  FMGuessYouLikeCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/8.
//  Copyright © 2018 flowerflower. All rights reserved.
//

import UIKit

class FMGuessYouLikeCell: BaseCell {

    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5 //列间隙
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        layout.itemSize = CGSize(width: (screenW - 45)/3, height:(screenW - 120)/2.0)
        let collectionView = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FMGuessYouLikeCollectionCell.self, forCellWithReuseIdentifier: "FMGuessYouLikeCollectionCellID")
        return collectionView
    }()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArr:[FMHomeRecommendHeaderModel] = [FMHomeRecommendHeaderModel](){
        
        didSet{
            
            self.collectionView.reloadData()
        }
    }


}
extension  FMGuessYouLikeCell{
   
    private func setupSubView(){
        
        addSubview(collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            
            make.top.left.right.bottom.equalToSuperview()
        }
  
    }

}

extension FMGuessYouLikeCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.dataArr.count > 6 ? 6 : self.dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FMGuessYouLikeCollectionCellID", for: indexPath) as! FMGuessYouLikeCollectionCell
        cell.model = self.dataArr[indexPath.row]
        
        return cell
    }
    
    
}



class FMGuessYouLikeCollectionCell: UICollectionViewCell {

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
        titleLabel.font = UIFont.systemFont(ofSize: 10)
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
    
    var model: FMHomeRecommendHeaderModel? {
        
        didSet{
            guard let model = model  else {
                return
                
            }
            
            let url = URL(string: model.pic ?? "")
            imgView.sd_setImage(with: url, placeholderImage:  UIImage(named:"empty_picture"))
            
            titleLabel.text = model.title
            
            var  playsCounts: String?
            
            //            guard let playsCount = model.playsCount else {
            //                return
            //            }
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




extension  FMGuessYouLikeCollectionCell{
    
    private func setupSubView(){
        
        addSubview(bgView)
        bgView.addSubview(imgView)
        bgView.addSubview(playImgView)
        bgView.addSubview(playLabel)
        bgView.addSubview(titleLabel)
        

        
        
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
            make.right.equalTo(imgView.snp.right)
            make.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
        
    }
    
    
}











