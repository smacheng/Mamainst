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


class BaseViewController: UIViewController {

    
    let ScreenWidth : CGFloat = UIScreen.mainScreen().bounds.width
    let ScreenHeight : CGFloat = UIScreen.mainScreen().bounds.height
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
