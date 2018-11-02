//
//  UIBarButtonItem+Extension.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/2.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    class func item(imageName: String,  target: Any?, action: Selector) -> UIBarButtonItem{
        
        
        let btn = UIButton()

        btn.setImage(UIImage(named:imageName), for: .normal)
        
        // button自适应大小
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView: btn)
    }
    
}
