//
//  FMHotSearchListCell.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/13.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit

class FMHotSearchListCell: BaseCell {

    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5 //列间隙
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        
        layout.itemSize = CGSize(width: (screenW - 45)/2, height:45)
        let collectionView = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FMHotSearchListCollectionCell.self, forCellWithReuseIdentifier: "FMHotSearchListCollectionCellID")
        return collectionView
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArr:[FMHotSearchListModel] = [FMHotSearchListModel]() {
        
        didSet{
            self.collectionView.reloadData()
        }
        
        
    }
    
}

extension FMHotSearchListCell{
    
    
    private func setupSubView(){
        
        addSubview(collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    
}

extension FMHotSearchListCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FMHotSearchListCollectionCellID", for: indexPath) as! FMHotSearchListCollectionCell
       cell.model = self.dataArr[indexPath.row]
       let index = indexPath.row
        cell.numberLabel.textColor = cell.getNumberColor(index:index)
        cell.numberLabel.font = (index == 0 || index == 1 || index == 2 ) ? UIFont.boldSystemFont(ofSize: 15) : UIFont.systemFont(ofSize: 13)
        cell.numberLabel.text = "\(indexPath.row + 1)"
        return cell
    }

}
    

class FMHotSearchListCollectionCell: UICollectionViewCell {

     lazy var numberLabel:UILabel = {
       let  numberLabel = UILabel()
        numberLabel.font = UIFont.systemFont(ofSize: 13)
        return numberLabel
        
    }()
    
    private lazy var titleLabel:UILabel = {
        let  titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        return titleLabel
        
    }()
    
    private lazy var shiftLabel:UILabel = {
       
        let  shiftLabel = UILabel()
        shiftLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return shiftLabel
        
    }()
    func getNumberColor(index:Int) -> UIColor {
        
        let colors:Array = ["E5542A","F4A460","FF8C00"]
        
        if index == 0 || index == 1 || index == 2 {
            
            return  UIColor.withHex(hexString: colors[index])
            
        }else{
            return UIColor.withHex(hexString: "BC8F8F")
        }
        
    }
    var model:FMHotSearchListModel? {
        
        didSet{
            
            guard let model = model  else { return }
        
         titleLabel.text  = model.word
        shiftLabel.textColor = (model.shift == 1) ? UIColor.red : UIColor.green
        shiftLabel.text = (model.shift == 1) ? "↑": "↓"
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension  FMHotSearchListCollectionCell{
    
    private func setupSubView(){
        
        addSubview(numberLabel)
        addSubview(titleLabel)
        addSubview(shiftLabel)
        
        
        numberLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(numberLabel.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        shiftLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.width.equalTo(15)
            make.height.equalTo(25)
            make.centerY.equalToSuperview()

        }
        
    }
    
}









