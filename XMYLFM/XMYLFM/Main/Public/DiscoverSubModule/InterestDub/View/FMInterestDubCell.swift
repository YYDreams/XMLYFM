//
//  FMInterestDubCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMInterestDubCell: BaseCell {

    
    //播放时间以及播放次数
    @IBOutlet weak var durationLabel: UILabel!
    
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

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    var model: FMIntereDubModel?{
        
        
        didSet{
            
            guard let model = model else {
                return
            }
            
            
            
            nicknameLabel.text  = model.nickname
            titleLabel.text = model.title
            
        }
        
    }
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
