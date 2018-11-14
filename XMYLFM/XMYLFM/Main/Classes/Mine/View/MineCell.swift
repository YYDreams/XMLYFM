//
//  MineCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/1.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import SDWebImage
import FLAnimatedImage
class MineCell: BaseCell {


    @IBOutlet weak var isLoginBtn: UIButton!
    
    
    @IBOutlet weak var avatarImgView: UIImageView! //头像
    
    @IBOutlet weak var userNameLabel: UILabel! //昵称
    
    @IBOutlet weak var userTitleLabel: UILabel! // LV 宝宝
    
    @IBOutlet weak var followingsLabel: UILabel! //粉丝+关注
    
    @IBOutlet weak var iconPathImgView: FLAnimatedImageView! // 右侧积分图标
    
    @IBOutlet weak var jfTipLabel: UILabel!
    
    @IBOutlet weak var vipTipLabel: UILabel! // vip会员占位文字
    
    @IBOutlet weak var subTitleLabel: UILabel!  //听满3小时。。。。。
    @IBOutlet weak var followingAndUserNameConst: NSLayoutConstraint!
    
    @IBOutlet weak var rightView: UIView!
    
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
            
            userTitleLabel.isHidden  = !( LoginHelper.sharedInstance.userInfo?.isLogin ?? false)
            
            if !( LoginHelper.sharedInstance.userInfo?.isLogin ?? false) {
                
                userNameLabel.text = "点击登录"
                
                followingsLabel.text = "登录后数据不丢失"
                
                jfTipLabel.text =  "登录领取\n积分会员"
               
                subTitleLabel.text  = nil
                
                followingAndUserNameConst.constant = 15
                
            }else{
                followingAndUserNameConst.constant = 10

                userNameLabel.text = model.nickname
                userTitleLabel.text = " LV+ \( model.userTitle ?? "")) "
                followingsLabel.text = "粉丝 \(model.favorites)  关注\(model.followings)"
                subTitleLabel.text =  " 听满3小时，即可解锁我的成就>  "
                vipTipLabel.text = model.vipTip ?? ""
                let checkInReminder = model.checkInRemindInfo?.checkInReminder ?? ""
                let checkInReward = model.checkInRemindInfo?.checkInReward ?? ""
                jfTipLabel.text =  checkInReminder + "\n" + checkInReward
                if   model.checkInRemindInfo?.iconPath != nil{
                    
                    
                    let url = URL(string: (model.checkInRemindInfo?.iconPath!)!)
                    
                     let data =  NSData(contentsOf: url!)
                    iconPathImgView.animatedImage = FLAnimatedImage(animatedGIFData: data! as Data)
                }
                
            }

        }

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

  
        let maskPath: UIBezierPath = UIBezierPath(roundedRect: self.rightView.bounds, byRoundingCorners: [.topLeft,.bottomLeft], cornerRadii: CGSize(width: 20, height: 20))
        
        let maskLayer:CAShapeLayer  = CAShapeLayer()
         maskLayer.frame = rightView.bounds
        maskLayer.path = maskPath.cgPath
        
        rightView.layer.mask = maskLayer
        
        if UserInfoModel.isLoginStatus() {
            subTitleLabel.layer.masksToBounds = true
            subTitleLabel.layer.cornerRadius = 8
            subTitleLabel.layer.borderWidth = 1.0;
            subTitleLabel.layer.borderColor = kBgColor.cgColor
            
            userTitleLabel.layer.masksToBounds = true
            userTitleLabel.layer.cornerRadius = 5
            
            
        }
        
 

    }

  
    @IBAction func isLoginBtnOnClick(_ sender: UIButton) {
        
        print("---------------------------")
        
        sender.isUserInteractionEnabled  = !( LoginHelper.sharedInstance.userInfo?.isLogin ?? false)

        if !( LoginHelper.sharedInstance.userInfo?.isLogin ?? false) {
            

            if self.handerLoginBtnOnClickCallBack != nil {
                
                self.handerLoginBtnOnClickCallBack!()
            }
            
        }else{}
        
        
    }
}
