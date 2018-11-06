//
//  FMPicCollectionView.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/6.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

private let FMPicCollectionViewCellID = "FMPicCollectionViewCellID"
class FMPicCollectionView: UICollectionView {


    var picUrls: [NSURL] = [NSURL]() {
       
        didSet{
            
            dataSource = self
            delegate  = self
            register(FMPicCollectionViewCell.self, forCellWithReuseIdentifier: FMPicCollectionViewCellID)
        self.reloadData()
            
        }
        
    }
    

    

}

extension FMPicCollectionView:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return picUrls.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // as! PicCell  将cell 转成 PicCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FMPicCollectionViewCellID, for: indexPath) as! FMPicCollectionViewCell
        cell.picUrl = picUrls[indexPath.item]
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        let info = [kRecommendShowPhotoBrowserIndexKey:indexPath,kRecommendShowPhotoBrowserUrlKey: picUrls] as [String : Any]
        
        
        NotificationCenter.default.post(name: NSNotification.Name(kRecommendPhotoSelectItemNotification), object: nil, userInfo: info)
    }
    
    
}

