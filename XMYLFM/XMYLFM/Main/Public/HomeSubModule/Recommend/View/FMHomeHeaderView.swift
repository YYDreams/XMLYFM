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

    //MARK: Lazy Methods
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
       pageControl.currentPageIndicatorSize = CGSize(width: 5, height: 5)
        pageControl.pageIndicatorTintColor = UIColor.withHex(hexString: "000000", alpha: 0.6)

        return pageControl
    }()
    //MARK: init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
            setupSubView()
        
    }
 //MARK: setupSubView 
    private func setupSubView() {
        
        addSubview(self.pagerView)
        addSubview(self.pageControl)
        
        
        self.pagerView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(40)
            make.height.equalTo(160)
        }
        
        self.pageControl.snp.makeConstraints { (make) in
            make.width.height.equalTo(10)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).offset(-10)
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
//MARK: <TYCyclePagerViewDataSource,TYCyclePagerViewDelegate>
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
    
    func pagerView(_ pageView: TYCyclePagerView, didScrollFrom fromIndex: Int, to toIndex: Int) {
        
        self.pageControl.currentPage = toIndex
        self.pageControl.currentPageIndicatorSize = CGSize(width: 8, height: 8)
        
        
    }
    func pagerView(_ pageView: TYCyclePagerView, didSelectedItemCell cell: UICollectionViewCell, at index: Int) {
        
        print("\(self.dataArr[index].cover ?? "")")
        
    }
    
}
//MARK:-----------------------FMBannerCell-------------------------
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
        imgView.layer.masksToBounds = true
        
        return imgView
        
        
    }()
    
}


//MARK:-----------------------FMHomeSectionView-------------------------
class FMHomeSectionView: UIView {

     lazy var titleLabel:UILabel = {
        
        let titleLabel = UILabel()
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        titleLabel.text = "猜你喜欢"
        return titleLabel
        
    }()
     lazy var imgView1:UIImageView = {
       
        return UIImageView(image: UIImage(named: "home_gif_recommended_0"))
        
    }()
    
     lazy var clickMeLabel:UILabel = {
        
        let clickMeLabel = UILabel()
        
        clickMeLabel.font = UIFont.boldSystemFont(ofSize: 13)
        clickMeLabel.text = "点我猜更准"
        clickMeLabel.textColor = kThemeColor
        return clickMeLabel
    }()
    
     lazy var moreLabel:UILabel = {
        
        let moreLabel = UILabel()
        
        moreLabel.font = UIFont.boldSystemFont(ofSize: 10)
        moreLabel.textColor = k6Color
        moreLabel.text = "更多 >"
        return moreLabel
        
    }()
    
    
    
      func isGuessYouLike(isGuessYouLike: Bool){
        moreLabel.isHidden = !isGuessYouLike
        clickMeLabel.isHidden = !isGuessYouLike
        imgView1.isHidden = !isGuessYouLike

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubView(){
        
        backgroundColor = UIColor.white
        addSubview(titleLabel)
        addSubview(imgView1)
        addSubview(clickMeLabel)
        addSubview(moreLabel)
        
        
        titleLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
        
        imgView1.snp.makeConstraints { (make) in
            
            make.left.equalTo(titleLabel.snp.right).offset(5)
            make.width.equalTo(15)
            make.height.equalTo(11)
            make.centerY.equalToSuperview()
        }
        clickMeLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(imgView1.snp.right)
            make.centerY.equalToSuperview()
        }
        moreLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(-15)
            make.centerY.equalToSuperview()
        }
        
        
        
    }
    
}

