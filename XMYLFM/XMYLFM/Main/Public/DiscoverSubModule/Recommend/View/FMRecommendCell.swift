//
//  FMRecommendCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/6.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
private let magin: CGFloat = 15
private let iteMagin: CGFloat = 10
class FMRecommendCell: UITableViewCell {

    
    @IBOutlet weak var avatarImgView: UIImageView!
    
    
    @IBOutlet weak var nicknameLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var collectionView: FMPicCollectionView!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var likesCountLabel: UILabel!
    
    @IBOutlet weak var commentsCountLabel: UILabel!

    @IBOutlet weak var contentWidthConst: NSLayoutConstraint!

    @IBOutlet weak var collectionViewHeightConst: NSLayoutConstraint!
    
    @IBOutlet weak var collectionViewWidthConst: NSLayoutConstraint!
    
    @IBOutlet weak var collectionViewBottomConst: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    
    var viewModel: DiscoverViewModel?{
        
        didSet{
            
            
            guard let viewModel = viewModel else {
                return
            }
            guard let  avatar = viewModel.recommendModel?.avatar else {
                
                return
            }
            
            avatarImgView.sd_setImage(with: URL(string: avatar), placeholderImage: UIImage(named: ""))
            
            nicknameLabel.text = viewModel.recommendModel?.nickname
            
            guard let likesCount = viewModel.recommendModel?.likesCount else {
                return
            }
            subTitleLabel.text =  likesCount > 20 ? "大家都在看" : "你可能感兴趣的内容"
            
            contentLabel.text = viewModel.recommendModel?.content
            
            timeLabel.text = viewModel.createTime
            
            likesCountLabel.text =  "\(viewModel.recommendModel?.likesCount ?? 0 )"
            
            commentsCountLabel.text =  "\(viewModel.recommendModel?.commentsCount ?? 0 )"
            
            collectionView.picUrls = viewModel.picUrls
            
            let picViewSize  = calculatePicViewSize(count: viewModel.picUrls.count)
            
            collectionViewHeightConst.constant = picViewSize.height
            
            collectionViewWidthConst.constant = picViewSize.width
            
            print(picViewSize)

            //注意：如需手动计算 则需要去除底部约束
            if viewModel.cellHeight == 0 {  // 如果从没有计算过 才需要计算
                layoutIfNeeded()
                viewModel.cellHeight = (bottomView.frame).maxY  //手动计算cell的高度 并将高度保存到viewModel模型中
                
                print(viewModel.cellHeight)
                
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()

           contentWidthConst.constant = screenW - 2 * 10
    }

    
}

extension FMRecommendCell{
    
    
    private func calculatePicViewSize(count:Int) -> CGSize {
        
        /**
         注意约束冲突 当count == 0  距离正文10  距离bottomView 10
         解决措施 修改collectionView的优先级Priority 700
         则会选用优先级高的约束  优先级低的约束则不会生效
         */
        /**
         图片显示分几种情况:
         1.没有配图
         2.4张配图
         3.其他张配图 (count -1)/3 + 1  = rows
         */
        
        //1.没有配图
        if count == 0 {
            collectionViewBottomConst.constant = 0
            
            return CGSize(width: 0, height: 0)
        }
        
        collectionViewBottomConst.constant = 10

        // 取出picView对应的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        

        //图片的WH
        let imageViewWH = (screenW - 2 * magin - 2 * iteMagin) / 3
        
        layout.itemSize = CGSize(width: imageViewWH, height: imageViewWH)
        //2. 4张配图
        if  count == 4 {
            
            let picViewWH = imageViewWH * 2 +  iteMagin + 1  //+1微调
            
            return CGSize(width: picViewWH, height: picViewWH)
        }
        
        // 3.其他张配图 (count -1)/3 + 1  = rows
        /**
         例子:  5张配图  2行   row:(5-1)/3+1 = 2
         */
        // 4.1 计算行数
        let rows = CGFloat( (count - 1 )/3 + 1)
        //  4.2 计算高度
        let picViewH = rows * imageViewWH + (rows - 1 ) * iteMagin
        //  4.3 计算宽度
        let picViewW = screenW - 2 * magin
        
        return CGSize(width: picViewW, height: picViewH)

        
    }
    
}







