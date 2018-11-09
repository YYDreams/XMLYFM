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
        let collectionView = UICollectionView.init(frame:CGRect(x: 0, y: 0, width: screenW, height: 300), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FMLikeCollectionViewCell.self, forCellWithReuseIdentifier: "FMLikeCollectionViewCellID")
        return collectionView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension  FMGuessYouLikeCell{
    
    private func setupSubView(){
        
        addSubview(collectionView)
        
        
    }
    
    
}

extension FMGuessYouLikeCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FMLikeCollectionViewCellID", for: indexPath) as! FMLikeCollectionViewCell
        return cell
    }
    
    
}


