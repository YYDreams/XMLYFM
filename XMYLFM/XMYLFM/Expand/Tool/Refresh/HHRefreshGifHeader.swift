//
//  HHRefreshGifHeader.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/8.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit
import MJRefresh
class HHRefreshGifHeader: MJRefreshGifHeader {

    
    
    override func prepare() {
        super.prepare()
        
        setImages([UIImage(named: "pullToRefresh_0_80x60_")!], for: .idle)
        setImages([UIImage(named: "pullToRefresh_0_80x60_")!], for: .pulling)
        setImages([UIImage(named: "pullToRefresh_0_80x60_")!,
                   UIImage(named: "pullToRefresh_1_80x60_")!,
                   UIImage(named: "pullToRefresh_2_80x60_")!,
                   UIImage(named: "pullToRefresh_3_80x60_")!,
                   UIImage(named: "pullToRefresh_4_80x60_")!,
                   UIImage(named: "pullToRefresh_5_80x60_")!,
                   UIImage(named: "pullToRefresh_6_80x60_")!,
                   UIImage(named: "pullToRefresh_7_80x60_")!,
                   UIImage(named: "pullToRefresh_8_80x60_")!,
                   UIImage(named: "pullToRefresh_9_80x60_")!], for: .refreshing)
        
        lastUpdatedTimeLabel.isHidden = true
        stateLabel.isHidden = true
        
    }


}
