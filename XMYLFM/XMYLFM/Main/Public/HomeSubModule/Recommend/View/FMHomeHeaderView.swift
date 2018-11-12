//
//  FMGuessYouLikeView.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/9.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import TYCyclePagerView

private let FMBannerCellID = "FMBannerCellID"
private let kItemSize:CGFloat = 0.9;

class FMHomeHeaderView: UIView {

 
    private lazy var pagerView:TYCyclePagerView = {
       
        let pagerView = TYCyclePagerView()
        pagerView.isInfiniteLoop = true
        pagerView.autoScrollInterval = 3
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FMBannerCell.self, forCellWithReuseIdentifier: FMBannerCellID)
        return pagerView
    }()
    private lazy var pageControl:TYPageControl = {
        
        let pageControl = TYPageControl()
       pageControl.currentPageIndicatorSize = CGSize(width: 6, height: 6)
        pageControl.pageIndicatorTintColor = UIColor.withHex(hexString: "000000", alpha: 0.6)

        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(self.pagerView)
        addSubview(self.pageControl)
        
        
        
        
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
//          pagerView.frame =  CGRect(x: 0, y: 40, width: screenW  , height: 160)
/**
         UIPageControl *pageControl = [[UIPageControl alloc] init];
         CGSize pointSize = [pageControl sizeForNumberOfPages:self.datas.count];
         CGFloat page_x = -(self.pageControl.bounds.size.width - pointSize.width) / 2 ;
         [self.pageControl setBounds:CGRectMake(page_x,
         self.pageControl.bounds.origin.y,
         self.pageControl.bounds.size.width,
         self.pageControl.bounds.size.height)];
         CGFloat pageCtrlY = CGRectGetHeight(_pagerView.frame) - 46;
         self.pageControl.frame = CGRectMake(0, pageCtrlY, CGRectGetWidth(_pagerView.frame) - 30, 26);
         */

        self.pagerView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(40)
            make.height.equalTo(160)
        }
        
        self.pageControl.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArr:[FMHomeRecommendHeaderModel] = [FMHomeRecommendHeaderModel](){
        
        didSet{
         
            self.pagerView.reloadData()
            self.pageControl.numberOfPages = self.dataArr.count
        }
    }
    
}

extension FMHomeHeaderView:TYCyclePagerViewDataSource,TYCyclePagerViewDelegate{
    
    
    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        
        return self.dataArr.count
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: FMBannerCellID, for: index) as! FMBannerCell
        cell.imageURL = URL(string: self.dataArr[index].cover ?? "")
        return cell
    }
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        
        let layout = TYCyclePagerViewLayout()
        
        
        layout.itemSize = CGSize(width:(pageView.frame).width * kItemSize, height: (pageView.frame).height * kItemSize)
        layout.itemSpacing = 0
        layout.layoutType = .coverflow
        return layout
    }
    
    
}

class FMBannerCell: UICollectionViewCell {
    
    
    var imageURL: URL?{
        didSet{
           
            addSubview(imgView)
            imgView.snp.makeConstraints { (make) in
                
                make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
                
            }
            self.imgView.sd_setImage(with: imageURL)
      
        }
        
    }
    private lazy var imgView: UIImageView = {
        
        let imgView = UIImageView()
       imgView.layer.cornerRadius = 6
        imgView.backgroundColor = UIColor.orange
        imgView.layer.masksToBounds = true
        
        return imgView
        
        
    }()
    
}
