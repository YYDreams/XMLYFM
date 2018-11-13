//
//  FMHomeBaseCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/13.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHomeBaseCell: BaseCell {

     lazy var collectionView : UICollectionView = {

        let collectionView = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5 //列间隙
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        layout.itemSize = CGSize(width: (screenW - 45)/3, height:(screenW - 120)/2.0)
       
        return layout
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            
            make.top.left.right.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}

extension FMHomeBaseCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return  UICollectionViewCell()
    }
    
}
