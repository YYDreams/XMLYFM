//
//  FMPhotoBrowserCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/6.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import SDWebImage
typealias FMPhotoBrowserCellItemOnClick = () -> Void
class FMPhotoBrowserCell: UICollectionViewCell {
    
    
    var itemCallBack: FMPhotoBrowserCellItemOnClick?
    private lazy var scrollView: UIScrollView = UIScrollView()
    lazy var picUrlImageView: UIImageView = UIImageView()
    
    var picUrl:NSURL?{
        
        didSet{
           
            guard let picUrls = picUrl else {
                return
            }
            
            
            let  image = SDWebImageManager.shared().imageCache?.imageFromDiskCache(forKey: picUrls.absoluteString)
            
            let height  = screenW / image!.size.width * image!.size.height
            var y = CGFloat(0)
            
            if height > screenH {
                
                y = 0
                
            }else{
                
                y = (screenH - height) * 0.5
            }
            
            picUrlImageView.image = image
            
            picUrlImageView.frame = CGRect(x: 0, y: y, width: screenW, height: height)
            
            picUrlImageView.sd_setImage(with: picUrls as URL, placeholderImage: UIImage(named: ""))
        
                scrollView.contentSize = CGSize(width: 0, height: height)

        }
        
        
        
    }
    
    
    
    override init(frame: CGRect) {
        
        
        super.init(frame: frame)
        
        
        
        
        setupSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private  func  setupSubView(){
        
        addSubview(scrollView)
        
        addSubview(picUrlImageView)
        
        scrollView.frame = contentView.bounds

        picUrlImageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageCloseOnClick))
        
        picUrlImageView.addGestureRecognizer(tap)
    }
    @objc  func imageCloseOnClick(){
        
        
        if itemCallBack != nil {
            
            itemCallBack!()
            
        }
        
        
        
        
    }
    
    
    func getBigUrl(smallUrl:NSURL) -> NSURL {
        
        
        let smallStr = smallUrl.absoluteString
        
        let bigUrl = smallStr?.replacingOccurrences(of: "thumbnail", with: "bmiddle")
        
        
        return NSURL(string: bigUrl!)!
        
    }
    
    
}
