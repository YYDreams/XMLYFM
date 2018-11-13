//
//  FMHomeLiveCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/13.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHomeLiveCell: FMHomeBaseCell {
    

    var dataArr:[FMHomeRecommendLiveModel] = [FMHomeRecommendLiveModel]() {
        
        
        didSet{
            
            self.collectionView.reloadData()
            
        }
        
        
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.register(FMHotSearchListCollectionCell.self, forCellWithReuseIdentifier: "FMHotSearchListCollectionCellID")

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FMHomeLiveCell{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dataArr.count
        
    }
    
    
 override   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FMHotSearchListCollectionCellID", for: indexPath) as! FMHotSearchListCollectionCell
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
}



class FMHomeLiveCollectionCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
