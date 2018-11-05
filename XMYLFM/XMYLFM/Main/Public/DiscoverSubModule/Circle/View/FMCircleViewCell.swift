//
//  FMCircleViewCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMCircleViewCell: BaseCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubView()

    }
    
    var dataArr:[FMCircleModel] = [FMCircleModel](){
        
        didSet{
            self.collectionView.reloadData()
        }
        
        
    }

 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var collectionView:FMCollectionView = {
        
        
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height:140)
        
        let collectionView = FMCollectionView.init(frame:CGRect(x: 0, y: 0, width: screenW, height: 150), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.green
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FMCircleCollectionCell.self, forCellWithReuseIdentifier: "FMCircleCollectionCellID")
                
        return  collectionView
    }()
    
    private func setupSubView(){
        
        self.addSubview(collectionView)
        
        
        
        
    }
    
    
}


extension FMCircleViewCell: UICollectionViewDataSource,UICollectionViewDelegate{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FMCircleCollectionCellID", for: indexPath) as! FMCircleCollectionCell
        cell.model = self.dataArr[indexPath.item]
        return cell
    }
    

    
}
