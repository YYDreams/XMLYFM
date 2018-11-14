//
//  FMHomeRecommendController.swift
//  XMYLFM
//
//  Created by flowerflower on 2018/11/8.
//  Copyright © 2018年 flowerflower. All rights reserved.
//

import UIKit


private let FMGuessYouLikeCellID = "FMGuessYouLikeCellID" //猜你喜欢
private let FMHotSearchListCellID = "FMHotSearchListCellID" //喜马热搜榜
private let FMHomeLiveCellID = "FMHomeLiveCellID" //直播
private let FMHomeTableViewCellID = "FMHomeTableViewCellID" //首页 cell
private let FMHomePaidCategoryCellID = "FMHomePaidCategoryCellID" //首页 精品 cell
private let FMHomeOneKeyListenCellID = "FMHomeOneKeyListenCellID" //首页 一键听



class FMHomeRecommendController: BaseTableViewController {
    
    private lazy var focusArr: [FMHomeRecommendHeaderModel] = [FMHomeRecommendHeaderModel]() //轮播图数组
    private lazy var squareDataArr: [DiscoverModel] = [DiscoverModel]()   //方块数组
    private lazy var guessYouLikeArr:[FMHomeRecommendHeaderModel] = [FMHomeRecommendHeaderModel]()  //猜你喜欢数组
    private lazy var hotSearchListArr:[FMHotSearchListModel] = [FMHotSearchListModel]()  //喜马热搜榜
    private lazy var recommendArr:[FMHomeRecommendModel] = [FMHomeRecommendModel]()  //推荐数据
    private lazy var liveArr:[FMHomeRecommendLiveModel] = [FMHomeRecommendLiveModel]()  //直播数据
    private lazy var albumArr:[FMHomeAlbumModel] = [FMHomeAlbumModel]()  //首页cell数据
    private lazy var paidCategoryArr:[FMHomePaidCategoryModel] = [FMHomePaidCategoryModel]()  //精品
    private lazy var oneKeyListenArr:[FMHomeOneKeyListenModel] = [FMHomeOneKeyListenModel]()  //一键听

    
    private lazy var homeSectionView: FMHomeSectionView = {
        
        let homeSectionView = FMHomeSectionView(frame: CGRect(x: 0, y: 0, width: screenW, height: 40))
        
        return homeSectionView
        
    }()
    private lazy var bannerView: FMHomeHeaderView = {
        
        let bannerView = FMHomeHeaderView(frame: CGRect(x: 0, y: 0, width: screenW, height: 200))
        
        return bannerView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
          setupTableView()
        loadDataFormNetwork()


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

}

extension FMHomeRecommendController{
    
    private func setupTableView(){

        tableView.register(FMGuessYouLikeCell.self, forCellReuseIdentifier: FMGuessYouLikeCellID)
        tableView.register(FMHotSearchListCell.self, forCellReuseIdentifier: FMHotSearchListCellID)
        tableView.register(FMHomeLiveCell.self, forCellReuseIdentifier: FMHomeLiveCellID)
        tableView.register(FMHomeTableViewCell.self, forCellReuseIdentifier: FMHomeTableViewCellID)
        tableView.register(FMHomePaidCategoryCell.self, forCellReuseIdentifier: FMHomePaidCategoryCellID)
        tableView.register(FMHomeOneKeyListenCell.self, forCellReuseIdentifier: FMHomeOneKeyListenCellID)



        tableView.tableHeaderView = self.bannerView
        tableView.snp.makeConstraints{ (make) in
            
            make.left.top.equalTo(self.view)
            make.width.equalTo(screenW)
            make.height.equalTo(screenH - navHeight - tabBarHeight)
        }

    }

    @objc private func refreshOnClick(){
        
        print("refreshOnClickrefreshOnClick")
    }
    
}
extension FMHomeRecommendController {
    private func loadDataFormNetwork(){
        
 
        NetworkTool.shareNetworkTool().request(methodType: .GET, baseUrl: MAIN_URL_6, urlString: kHomeAllUrl, parameters: [:]) { (result, error) in
            
            if error != nil {
                return
            }
            
            guard let resultDic   = result  as? [String: AnyObject] else  {return}
            
            
            guard let headerArr = resultDic["header"] as? [[String : AnyObject]] else {return}
     
            
            for heaer in headerArr {
                
                guard let itemDic = heaer["item"] else { return }

                
                guard  let moduleType:String = (itemDic["moduleType"] as? String) else { return}
          
                if moduleType == "focus"{ // 轮播图
                    
                    guard  let focusList:[[String:AnyObject]] = (itemDic["list"] as? [[String:AnyObject]]) else { return }
                    
                    for listData in focusList{
                        
                        
                        guard   let listDataA = listData["data"] as? [[String:AnyObject]] else {return}
                        
                        for listDataB in listDataA {
                            
                            let model = FMHomeRecommendHeaderModel.deserialize(from: listDataB)!
                            
                            self.focusArr.append(model)
                        }
                    }
                    //
                }else if(moduleType == "square" ){ //方块
                    
                    guard  let squareList:[[String:AnyObject]] = (itemDic["list"] as? [[String:AnyObject]]) else { return }

                    for square in squareList {
                        
                        let model:DiscoverModel = DiscoverModel.deserialize(from: square)!
                        self.squareDataArr.append(model)
                    }
                } else { //猜你喜欢

                    guard let guessYouLikeList:[[String:AnyObject]] = (itemDic["list"] as? [[String:AnyObject]]) else{ return}

                    for guessYouLike in guessYouLikeList {

                        let model: FMHomeRecommendHeaderModel = FMHomeRecommendHeaderModel.deserialize(from: guessYouLike)!

                        self.guessYouLikeArr.append(model)
                        
                    }
                }
            }
            
            guard let bodyArr = resultDic["body"] as? [[String : AnyObject]] else {return}
            

            for body in bodyArr{

                guard let itemDic = body["item"] else { return }
            
                guard  let itemType:String = (body["itemType"] as? String) else { return}

                print("itemType====== \(itemType) ")  //15
                /**
 
                 itemType====== ALBUM
                 itemType====== ALBUM
                 itemType====== MODULE
                 itemType====== ALBUM
                 itemType====== ALBUM
                 itemType====== TRACK
                 itemType====== TRACK
                 itemType====== ALBUM
                 itemType====== SPECIAL
                 itemType====== ALBUM
                 itemType====== ALBUM
                 itemType====== ALBUM
                 itemType====== ALBUM
                 itemType====== TRACK
                 itemType====== MODULE
                 */
                print("tile======\(itemDic["title"])")  //喜马热搜榜 直播
                guard  let title:String = (itemDic["title"] as? String) else { return}

                if itemType == "MODULE"  && title == "喜马热搜榜"{ //=
                    
    
                    guard let modultList:[[String: AnyObject]]  = (itemDic["list"] as? [[String: AnyObject]]) else{ return }
                    
                    for modult in  modultList{

                        let model: FMHotSearchListModel = FMHotSearchListModel.deserialize(from: modult)!

                        print("titleeewew\(model.word ?? "")")
                        
                        self.hotSearchListArr.append(model)

                    }

                }else if (itemType == "live"  && title == "直播"){
                    
                    
                    guard let modultList:[[String: AnyObject]]  = (itemDic["list"] as? [[String: AnyObject]]) else{ return }
                    
                    for modult in  modultList{
                        
                        let model: FMHomeRecommendLiveModel = FMHomeRecommendLiveModel.deserialize(from: modult)!
                        
                        self.liveArr.append(model)
                        
                        
                    }
                }else if (itemType == "ALBUM"){
                    
                    guard let itemDic1 = body["item"] as? [String : AnyObject] else { return }
                    
                    let model:FMHomeAlbumModel =  FMHomeAlbumModel.deserialize(from: itemDic1)!
                    

                    self.albumArr.append(model)
                    
                    print("categorycategory\(model.category ?? "")")
                    
                }else if (itemType == "MODULE"  && title == "精品"){
                    
                    guard let paidCategoryList:[[String: AnyObject]]  = (itemDic["list"] as? [[String: AnyObject]]) else{ return }
                    
                    for paidCategory in  paidCategoryList{
                        
                        let model: FMHomePaidCategoryModel = FMHomePaidCategoryModel.deserialize(from: paidCategory)!

                        self.paidCategoryArr.append(model)
                        
                    }

                }else if (itemType == "MODULE"  && title == "懒人一键听"){
                    
                    guard let paidCategoryList:[[String: AnyObject]]  = (itemDic["list"] as? [[String: AnyObject]]) else{ return }
                    
                    for paidCategory in  paidCategoryList{
                        
                        let model: FMHomeOneKeyListenModel = FMHomeOneKeyListenModel.deserialize(from: paidCategory)!
                        
                        self.oneKeyListenArr.append(model)
                        
                    }
                    
                }


            }

            self.bannerView.dataArr = self.focusArr
            self.tableView.reloadData()
            print("reloadDatareloadDatareloadDatareloadDatareloadData")

            
      }
  }
    
}

extension FMHomeRecommendController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 7  // square  guessYouLike liveArr   album(homecell)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        return (section == 4) ? self.albumArr.count : 1
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        switch section {
        case 0:
            let headerView = DiscoverHeaderView(frame: CGRect(x: 0, y: 0, width: screenW, height: 100))
            headerView.square = self.squareDataArr
            return headerView
        case 1:
            homeSectionView.isGuessYouLike(isGuessYouLike: true)
            return homeSectionView
            
        case 2,3:
            let sectionView =  FMHomeSectionView(frame: CGRect(x: 0, y: 0, width: screenW, height: 40))
            sectionView.titleLabel.text = (section == 2) ? "喜马热搜榜": "直播"
            sectionView.isGuessYouLike(isGuessYouLike: false)
            return  sectionView
            
        case 5,6:
            let sectionView =  FMHomeSectionView(frame: CGRect(x: 0, y: 0, width: screenW, height: 40))
            sectionView.titleLabel.text = (section == 5) ? "精品": "懒人一键听"
            sectionView.isGuessYouLike(isGuessYouLike: false)
            return  sectionView
        default:
             break
        }
        return UIView()

    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
        if section ==  0 {
            
            return self.squareDataArr.count>0 ? 100 : 0
            
        }else if( section == 1) {
            
            return self.guessYouLikeArr.count>0 ? 40 : 0
            
        }else if( section == 2){
            
            return self.hotSearchListArr.count > 0 ? 40 : 0
        }else if( section == 3){
            
            return self.liveArr.count > 0 ? 40 : 0
            
        }else if( section == 4){
            
            return 0
        }else if( section == 5){
            
            return self.paidCategoryArr.count > 0 ? 40 : 0
        }else if( section == 6){
            
             return self.oneKeyListenArr.count > 0 ? 40 : 0
        }else {
            
            return  0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FMGuessYouLikeCellID, for: indexPath) as! FMGuessYouLikeCell
            
            cell.dataArr = self.guessYouLikeArr
            
            return cell
        }else if(indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: FMHotSearchListCellID, for: indexPath) as! FMHotSearchListCell
            cell.dataArr = self.hotSearchListArr
            return cell
        }else if(indexPath.section == 3){
            let cell = tableView.dequeueReusableCell(withIdentifier: FMHomeLiveCellID, for: indexPath) as! FMHomeLiveCell
            cell.dataArr =   self.liveArr

            return cell
        }else if (indexPath.section == 4){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FMHomeTableViewCellID) as! FMHomeTableViewCell
            cell.model   = self.albumArr[indexPath.row]
            
            return cell
        }else if (indexPath.section == 5){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FMHomePaidCategoryCellID, for: indexPath) as! FMHomePaidCategoryCell
            
            cell.dataArr = self.paidCategoryArr
            
            return cell
        }else if (indexPath.section == 6){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FMHomeOneKeyListenCellID, for: indexPath) as! FMHomeOneKeyListenCell
            
            cell.dataArr = self.oneKeyListenArr
            
            return cell
        }
    
        return UITableViewCell()
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
       if(indexPath.section == 1){
            return (self.guessYouLikeArr.count>0 ? ((screenW - 120)/2.0 * 2 + 20 ) : 0)
        }else if (indexPath.section == 4){
            
            return self.albumArr.count > 0 ? 100 : 0
            
        }else if (indexPath.section == 5){
            
            return self.paidCategoryArr.count > 0 ?  150 : 0
           
        }else if (indexPath.section == 6){
            
              return self.oneKeyListenArr.count > 0 ?  100 : 0

        }else{
            
            return 0
        }
     }

}
