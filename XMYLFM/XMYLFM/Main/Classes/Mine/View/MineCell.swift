//
//  MineCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/1.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import SDWebImage

class MineCell: BaseCell {


    @IBOutlet weak var isLoginBtn: UIButton!
    
    
    @IBOutlet weak var avatarImgView: UIImageView! //头像
    
    @IBOutlet weak var userNameLabel: UILabel! //昵称
    
    @IBOutlet weak var userTitleLabel: UILabel! // LV 宝宝
    
    @IBOutlet weak var followingsLabel: UILabel! //粉丝+关注
    
    @IBOutlet weak var iconPathImgView: UIImageView! // 右侧积分图标
    
    @IBOutlet weak var jfTipLabel: UILabel!
    
    @IBOutlet weak var vipTipLabel: UILabel! // vip会员占位文字
    
    @IBOutlet weak var subTitleLabel: UILabel!  //听满3小时。。。。。
    
    
    /**
     "checkInReminder":"待领取积分",
     "checkInReward":"+5积分",
     */
    @IBOutlet weak var checkInReminderLabel: UILabel!
    
    typealias LoginCallBack = () -> Void

    var handerLoginBtnOnClickCallBack: LoginCallBack?
    
    
    var model: MineModel? {
        
        didSet{
            
            guard let model = model else {
                return
            }

            userNameLabel.text = model.nickname
            userTitleLabel.text = model.userTitle
            followingsLabel.text = "粉丝 \(model.favorites)  关注\(model.followings)"
            
            vipTipLabel.text = model.vipTip
            
         let checkInReminder = model.checkInRemindInfo?.checkInReminder ?? ""
            let checkInReward = model.checkInRemindInfo?.checkInReward ?? ""
            jfTipLabel.text =  checkInReminder + "\n" + checkInReward
         
            if   model.checkInRemindInfo?.iconPath != nil{
                
                
                let url = URL(string: (model.checkInRemindInfo?.iconPath!)!)
                
                let data =  NSData(contentsOf: url!)
                iconPathImgView.image = UIImage(data: data! as Data)
            }
 
        }

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        subTitleLabel.layer.masksToBounds = true
        subTitleLabel.layer.cornerRadius = 8
        subTitleLabel.layer.borderWidth = 1.0;
        subTitleLabel.layer.borderColor = bgColor.cgColor

    }

  
    @IBAction func isLoginBtnOnClick(_ sender: UIButton) {
        
        print("---------------------------")
        sender.isUserInteractionEnabled = !LoginHelper.isLoginStatus()
        
        if !LoginHelper.isLoginStatus() {
            
            
            
            if self.handerLoginBtnOnClickCallBack != nil {
                
                self.handerLoginBtnOnClickCallBack!()
            }
            
        }
        
        
    }
}
