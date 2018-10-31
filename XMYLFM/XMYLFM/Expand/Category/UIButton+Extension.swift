//
//  UIButton+Extension.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/10/31.
//  Copyright © 2018年 flowerflower. All rights reserved.
//


import UIKit

extension UIButton {
    
    //swift中类方法是以class开头的方法，类似于OC中的+开头的方法
    
    class func createButton(imageName: String,bgImageName:String) -> UIButton{
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named:imageName), for: .normal)
        btn.setImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named:bgImageName), for: .normal)
        btn.setBackgroundImage(UIImage(named:bgImageName + "_highlighted"), for: .highlighted)
        return btn
        
    }
    
    
    
    /*
     convenience:便利，使用convenience修饰的叫做便利构造函数
     //遍历构造函数通常用在对系统的类进行构造函数的扩充时使用
     特点：
     1.遍历构造函数通常都是写在extension里面的
     2.遍历构造函数init前面需要加convenience
     3.在遍历构造函数中需要明确的调用self.init()
     如果不调用会报（Self.init isn't called on all paths before returning from initializer）错误
     
     **/
    
    convenience init(imageName: String,bgImageName: String){
        self.init()
        
        
        setImage(UIImage(named:imageName), for: .normal)
//        setImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
//        setBackgroundImage(UIImage(named:bgImageName), for: .normal)
//        setBackgroundImage(UIImage(named:bgImageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
    
    
    
    convenience init(imageName: String,highlightedName: String){
        self.init()
        
        setImage(UIImage(named:imageName), for: .normal)
        setImage(UIImage(named:highlightedName), for: .highlighted)
        
    }
    
}
