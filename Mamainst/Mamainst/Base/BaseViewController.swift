//
//  BaseViewController.swift
//  Mamainst
//
//  Created by 冉俊 on 16/6/16.
//  Copyright © 2016年 冉俊. All rights reserved.
//

/** 基类 */

import UIKit
import SnapKit
import Kingfisher


let ScreenWidth : CGFloat = UIScreen.mainScreen().bounds.width
let ScreenHeight : CGFloat = UIScreen.mainScreen().bounds.height

class BaseViewController: UIViewController {

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rj_backgroundColorHex()
        
                /// 设置导航栏返回按钮
        let item = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        self.navigationController?.navigationBar.tintColor = UIColor.rj_ColorHex("c8c8c8")
        
    }
    
    deinit {
        print(#function)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
