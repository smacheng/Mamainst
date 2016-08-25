//
//  MainViewController.swift
//  Mamainst
//
//  Created by 冉俊 on 16/6/16.
//  Copyright © 2016年 冉俊. All rights reserved.
//


/** 根控制器 */


import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = FirstPageViewController()
        let classVC = ClassifyViewController()
        let vipVC = VIpViewController()
        let liveVC = LiveViewController()
        let userCenterVC = UserCenterViewController()
        
        addChildViewControllers(firstVC, selectImage: "nav_home_pre", nomorImage: "nav_home", title: "首页")
        addChildViewControllers(classVC, selectImage: "nav_classify_pre", nomorImage: "nav_classify", title: "分类")
        addChildViewControllers(vipVC, selectImage: "nav_vip_pre", nomorImage: "nav_vip", title: "VIP")
        addChildViewControllers(liveVC, selectImage: "nav_videolive_pre", nomorImage: "nav_videolive", title: "直播")
        addChildViewControllers(userCenterVC, selectImage: "nav_my_pre", nomorImage: "nav_my", title: "我的")
    }
    
    private func addChildViewControllers(VC:UIViewController, selectImage:String, nomorImage:String, title:String) {
        VC.title = title
        
        VC.tabBarItem.selectedImage = UIImage(named: selectImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        VC.tabBarItem.image = UIImage.init(named: nomorImage)
        tabBar.tintColor = UIColor.rj_MainColorHex()
        
        let Nav = UINavigationController.init(rootViewController: VC)
        let item = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)
        Nav.navigationItem.backBarButtonItem = item
        addChildViewController(Nav)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
