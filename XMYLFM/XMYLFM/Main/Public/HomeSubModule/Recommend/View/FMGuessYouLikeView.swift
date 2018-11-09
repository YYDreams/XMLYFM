//
//  FMGuessYouLikeView.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/9.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMGuessYouLikeView: UIView {

    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (screenW-30)/5, height:90)
        let collectionView = UICollectionView.init(frame:CGRect(x: 0, y: 0, width: screenW, height: 100), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DiscoverHeaderCell.self, forCellWithReuseIdentifier: "DiscoverHeaderCellID")
        return collectionView
    }()
    override init(frame: CGRect) {
       
        super.init(frame: frame)
        
        setupInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInit(){
        
        backgroundColor = UIColor.red
        
        addSubview(collectionView)
        
    }
    
    
    
}





extension FMGuessYouLikeView:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverHeaderCellID", for: indexPath) as! DiscoverHeaderCell
        cell.backgroundColor = UIColor.green
        return cell
    }
    
    
}
