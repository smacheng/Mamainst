//
//  FirstPageViewController.swift
//  Mamainst
//
//  Created by 冉俊 on 16/6/16.
//  Copyright © 2016年 冉俊. All rights reserved.
//

import UIKit


private enum CollectionSection:Int {
    /** banner */
    case Banner = 0,
    /** 分类课程 */
    Classification = 1,
    /** 学院头条 */
    InstNews  = 2,
    /** 精品课程 */
    EssenceCourse  = 3,
    /** 学院导师 */
    InstTeacher = 4,
    /** 推荐课程 */
    recommendCourse = 5,
    /** 名家讲堂 */
    StarAuditorium = 6
}


let bannerHeight = ScreenWidth * 9.0 / 16.0


class FirstPageViewController: BaseViewController {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
        collection.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.bottom.equalTo(view)
        }
        
    }
    
    // MARK: - section中添加视图
    /**
     添加banner
     
     */
    private func addSectionOneBannerView() -> AdsPlayView{
        let url1 = NSURL(string: "http://img.pconline.com.cn/images/upload/upc/tx/photoblog/1503/17/c2/3974346_1426551981202_mthumb.jpg")
        let url2 = NSURL(string: "http://img1.3lian.com/img013/v4/96/d/51.jpg")
        let url3 = NSURL(string: "http://attimg.dospy.com/img/day_141110/20141110_13cd5c2f6e4fd64594a8zSsBJubClOFD.jpg")
        let banner = AdsPlayView(frame: CGRectMake(0, 0, ScreenWidth, bannerHeight), placeholderImage: UIImage.init(named: "banner占位图")!, URLArr:[url1!, url2!, url3!] )
        /** banner的点击事件 */
        banner.didSelectItemAtIndexBlock = {
            (indexPath) -> Void in
            print(indexPath.item)
        }
        return banner
    }
  
    
    // MARK: - lazy
    private lazy var collection: UICollectionView = {
        /// 初始化layout
        let layout = UICollectionViewFlowLayout()
        /// 初始化 UICollectionView
        let collection = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        /** 注册cell */
        collection.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collection.registerClass(MMClassificationCell.self, forCellWithReuseIdentifier: "MMClassificationCell")
        //        collection.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.rj_backgroundColorHex()
        return collection
    }()
    
    
    // MARK: - other
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}




// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FirstPageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
   
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UICollectionViewCell", forIndexPath: indexPath)
        
                /** banner */
        if indexPath.section == CollectionSection.Banner.rawValue {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UICollectionViewCell", forIndexPath: indexPath)

            cell.contentView.addSubview(addSectionOneBannerView())
            return cell
        }
        /** 分类 */
        else if indexPath.section == CollectionSection.Classification.rawValue {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MMClassificationCell", forIndexPath: indexPath) as! MMClassificationCell
            cell.backgroundColor = UIColor.whiteColor()
            return cell
        }
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
            case CollectionSection.Banner.rawValue:
                print(#function)
            case CollectionSection.Classification.rawValue:
                print(indexPath.item)
            case CollectionSection.InstNews.rawValue:
                print(#function)
            case CollectionSection.EssenceCourse.rawValue:
                print(#function)
            default:
                print("default")
            }
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 7
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case CollectionSection.Banner.rawValue:
                return 1
            case CollectionSection.Classification.rawValue:
                return 10
            case CollectionSection.InstNews.rawValue:
                return 1
            case CollectionSection.EssenceCourse.rawValue:
                return 3
            case CollectionSection.InstTeacher.rawValue:
                return 8
            case CollectionSection.recommendCourse.rawValue:
                return 6
            case CollectionSection.StarAuditorium.rawValue:
                return 3
            default:
                return 0
            }
    }
}




// MARK: - UICollectionViewDelegateFlowLayout
extension FirstPageViewController: UICollectionViewDelegateFlowLayout {
    /**
     section 的偏移
     
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        switch section {
        case CollectionSection.Banner.rawValue:
            return UIEdgeInsetsZero
        case CollectionSection.Classification.rawValue:
            return UIEdgeInsetsMake(0, 0, 0, 0)
            
        default:
            return UIEdgeInsetsZero
        }
    }
    /**
     每一个section里面行间距
     
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        switch section {
        case CollectionSection.Banner.rawValue:
            return 0
        case CollectionSection.Classification.rawValue:
            return 0
        default:
            return 0
        }
    }
    /**
     每一个section里面列间距
     
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        switch section {
        case CollectionSection.Banner.rawValue:
            return 0
        case CollectionSection.Classification.rawValue:
            return 0
        default:
            return 0
        }
        
    }
    /**
     每个item的大小
     
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        switch indexPath.section {
        case CollectionSection.Banner.rawValue:
            return CGSizeMake(ScreenWidth, bannerHeight)
        
        case CollectionSection.Classification.rawValue:
            return CGSizeMake(ScreenWidth / 5, 90)
            //        case 2:
            //            return CGSizeMake(<#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
            //        case 3:
            //            return CGSizeMake(<#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
            //        case 4:
            //            return CGSizeMake(<#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
            //        case 5:
            //            return CGSizeMake(<#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
            //        case 6:
            //            return CGSizeMake(<#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
            //        case 7:
        //            return CGSizeMake(<#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
        default:
            return CGSizeZero
        }
    }
}













