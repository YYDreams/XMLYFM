//
//  FMInterestDubCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit


typealias FMInterestDubCellHeight = (_ cellHeight: CGFloat) -> Void

class FMInterestDubCell: BaseCell {

    
    var cellHeight: FMInterestDubCellHeight?
    
    //播放时间以及播放次数
    @IBOutlet weak var durationLabel: UILabel!
    
    //新品
    @IBOutlet weak var recReasonLabel: UILabel!
    
    //title
    @IBOutlet weak var titleLabel: UILabel!
    
    //用户昵称
    @IBOutlet weak var nicknameLabel: UILabel!

    //用户头像
    @IBOutlet weak var logoPicImgView: UIImageView!

    //点赞数量
    @IBOutlet weak var favoritesLabel: UILabel!
    
    //消息数量
    @IBOutlet weak var commentCountLabel: UILabel!

    //"#谁还不是个宝宝了
    @IBOutlet weak var topicTitleLabel: UILabel!
    //topicTitle的高度
    @IBOutlet weak var topicTitleHeightConst: NSLayoutConstraint!
    
    @IBOutlet weak var logoPicAndTopTitleTopConst: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    var model: FMIntereDubModel?{
        
        
        didSet{
            
            
            guard let model = model else {
                return
            }
            
        
            nicknameLabel.text  = model.dubbingItem?.nickname
            
            guard let duration = model.dubbingItem?.duration,
                   let playTimes = model.dubbingItem?.playTimes
            else {
                return
                
            }
            let durationText = "00:\(duration) | \(playTimes)次播放"
            durationLabel.text  = durationText
            
            let length = model.dubbingItem?.topicTitle?.count ?? 0
            print("topicTitle---------:\(String(describing: length))")
            if length != 0 {
                
                topicTitleLabel.layer.cornerRadius = 5
                topicTitleLabel.layer.masksToBounds = true
                
                
                print("+++++++++++++++++++++++++++++++++++++++++++++++++")
                topicTitleLabel.text =  model.dubbingItem?.topicTitle
                topicTitleHeightConst.constant =  15
                logoPicAndTopTitleTopConst.constant = 10
            }else{
                
                print("--------------------------------------------------")
                topicTitleLabel.text = nil
                topicTitleHeightConst.constant = 0
                logoPicAndTopTitleTopConst.constant = 0
            }
            
    
            
            titleLabel.text = model.dubbingItem?.title
            
            guard let logoPic = model.dubbingItem?.logoPic else {
                
                return
            }
            
            logoPicImgView.layer.cornerRadius = 15
            logoPicImgView.layer.masksToBounds = true
            logoPicImgView.sd_setImage(with: URL(string:logoPic), placeholderImage: UIImage(named: ""))
            
            
            guard let favorites = model.dubbingItem?.favorites,
                  let commentCount = model.dubbingItem?.commentCount else {
                    return
                    
            }
            
            favoritesLabel.text = "\(String(describing:favorites))"
            
            commentCountLabel.text = "\(String(describing:commentCount))"
            
            recReasonLabel.text = model.feedItem?.recReason ?? ""
            
            recReasonLabel.layer.cornerRadius = 5
            recReasonLabel.layer.masksToBounds = true
            
            if model.cellHeight == 0 {
                
                layoutIfNeeded()

                model.cellHeight = (logoPicImgView.frame).maxY + 10.0 //手动计算cell的高度 并将高度保存到viewModel模型中

                print( model.cellHeight)
                
      
                }

        }
        
        
    }
  
    


}
