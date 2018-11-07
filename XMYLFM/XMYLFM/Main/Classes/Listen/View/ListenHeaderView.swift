//
//  ListenHeaderView.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/7.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit


typealias ListenHeaderViewBtnOnClickCallBack = (_ index: Int) -> Void


class ListenHeaderView: UIView {

    
    var handlerBtnOnClikCallBack:ListenHeaderViewBtnOnClickCallBack?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubView()
        
    }
    
    
    
    private func setupSubView(){
        
        let imageArray = ["下载","历史","购物车","喜欢"]
        let titleArray = ["下载","历史","已购","喜欢"]

        let btnWH:CGFloat = screenW/8
        
        for index in 0..<titleArray.count {
            
            // 0
            let button = UIButton.init(frame: CGRect(x:btnWH*CGFloat(index)*2+btnWH/2,y:10,width:btnWH,height:btnWH))

            button.setImage(UIImage(named: imageArray[index]), for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(btnOnClick), for: .touchUpInside)
            print(button.frame)
             addSubview(button)
            
            let titleLabel = UILabel()
            titleLabel.textAlignment = .center
            titleLabel.text = titleArray[index]
            titleLabel.font = UIFont.systemFont(ofSize: 15)
            titleLabel.textColor = UIColor.gray
            self.addSubview(titleLabel)
            
            titleLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(button)
                make.width.equalTo(btnWH + 20)
                make.top.equalTo(btnWH + 5)
            }
            
        }
 
        let lineView = UIView()
        addSubview(lineView)

        lineView.backgroundColor = kBgColor
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    
    @objc func btnOnClick(btn:UIButton){
    
        if  handlerBtnOnClikCallBack != nil {
            
            handlerBtnOnClikCallBack!(btn.tag)
            
        }
        
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    

}
