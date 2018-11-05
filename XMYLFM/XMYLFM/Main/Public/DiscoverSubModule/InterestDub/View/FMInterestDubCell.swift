//
//  FMInterestDubCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/5.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMInterestDubCell: BaseCell {

    
    
    
    @IBOutlet weak var durationLabel: UILabel!
    
    
    @IBOutlet weak var titleLabel: UILabel!

    
    @IBOutlet weak var nicknameLabel: UILabel!

    
    @IBOutlet weak var logoPicImgView: UIImageView!

    @IBOutlet weak var favoritesLabel: UILabel!

    
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
