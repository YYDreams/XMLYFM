//
//  DiscoverHeaderView.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/2.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class DiscoverHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
         setupSubView()
    }

    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (screenW-30)/5, height:90)
        let collectionView = UICollectionView.init(frame:self.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DiscoverHeaderCell.self, forCellWithReuseIdentifier: "DiscoverHeaderCellID")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupSubView(){
        
        self.addSubview(self.collectionView)
        let footerView = UIView()
        footerView.backgroundColor = UIColor.withHex(hexString: "F2F2F2")
        self.addSubview(footerView)
        footerView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    

    
    var square:[ DiscoverModel] =  [DiscoverModel](){
        
        didSet{
            
            self.collectionView.reloadData()
        }

        
    }

}


extension DiscoverHeaderView: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return square.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverHeaderCellID", for: indexPath) as! DiscoverHeaderCell
        cell.square = square[indexPath.row]
        return cell
    }
 
    
    
}
