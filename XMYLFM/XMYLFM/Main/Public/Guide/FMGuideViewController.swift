//
//  FMGuideViewController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/15.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

private let FMFMGuideViewCellID = "FMFMGuideViewCellID"
class FMGuideViewController: BaseUIViewController {

    var finishBtnClickCallBack: (()-> Void)?
    private var dataArr = ["guide1", "guide1", "guide1", "guide1"]
    private var isHiddenNextButton = true

    private lazy var collectionView: UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()

        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: screenW, height: screenH)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenW, height: screenH), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.backgroundColor = UIColor.red
        collectionView.register(FMPicCollectionViewCell.self, forCellWithReuseIdentifier: FMFMGuideViewCellID)
        return collectionView
        
    }()
    
    private lazy var pageCtrl:UIPageControl = {
        
        let pageCtrl = UIPageControl(frame: CGRect(x: 0, y:screenH - 50, width: screenW, height: 20))
        pageCtrl.numberOfPages = dataArr.count
        pageCtrl.currentPage = 0
        return pageCtrl
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(collectionView)
        view.addSubview(pageCtrl)
        
        
    }



}

extension FMGuideViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: FMFMGuideViewCellID, for: indexPath) as! FMPicCollectionViewCell
        cell.imageView.image = UIImage(named: self.dataArr[indexPath.row])
        
        if indexPath.row != dataArr.count - 1 {
            cell.setFinishBtnHidden(hidden: true)
            
        }
        cell.finishBtnClickCallBack = {[weak self] () -> Void in
            
            if self?.finishBtnClickCallBack != nil {
                
                self?.finishBtnClickCallBack!()
            }

        }
        
        return cell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x == screenW * CGFloat(dataArr.count - 1) {
            
            let index:IndexPath = IndexPath(row: dataArr.count - 1 , section: 0)

            let cell = collectionView.cellForItem(at: index) as! FMPicCollectionViewCell
            cell.setFinishBtnHidden(hidden: false)
            isHiddenNextButton = false
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        
        if scrollView.contentOffset.x != screenW * CGFloat(dataArr.count - 1) && !isHiddenNextButton && scrollView.contentOffset.x > screenW * CGFloat(dataArr.count - 2) {
            let index:IndexPath = IndexPath(row: dataArr.count - 1 , section: 0)
            let cell = collectionView.cellForItem(at: index) as! FMPicCollectionViewCell
            cell.setFinishBtnHidden(hidden: true)
            isHiddenNextButton = true
        }
        
        pageCtrl.currentPage = Int(scrollView.contentOffset.x / screenW + 0.5)
    }
        
    
    
}
