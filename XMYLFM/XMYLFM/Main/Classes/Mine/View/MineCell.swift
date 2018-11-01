//
//  MineCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/1.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit


class MineCell: BaseCell {

    
  

    
    @IBOutlet weak var isLoginBtn: UIButton!
    
    
    @IBOutlet weak var avatarImgView: UIImageView! //头像
    
    @IBOutlet weak var userNameLabel: UILabel! //昵称
    
    @IBOutlet weak var userTitleLabel: UILabel! // LV 宝宝
    
    @IBOutlet weak var followingsLabel: UILabel! //粉丝+关注
    
    @IBOutlet weak var iconPathImgView: UIImageView! // 右侧积分图标
    
    @IBOutlet weak var vipTipLabel: UILabel! // vip会员占位文字
    
    
    /**
     "checkInReminder":"待领取积分",
     "checkInReward":"+5积分",
     */
    @IBOutlet weak var checkInReminderLabel: UILabel!
    
    typealias LoginCallBack = () -> Void

    var handerLoginBtnOnClickCallBack: LoginCallBack?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()



    }

  
    @IBAction func isLoginBtnOnClick(_ sender: UIButton) {
        
        
        if !LoginHelper.isLoginStatus() {
            
            
            
            if self.handerLoginBtnOnClickCallBack != nil {
                
                self.handerLoginBtnOnClickCallBack!()
            }
            
        }
        
        
    }
}
