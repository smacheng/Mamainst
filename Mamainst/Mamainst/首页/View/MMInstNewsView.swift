//
//  MMInstNewsView.swift
//  Mamainst
//
//  Created by 冉俊 on 16/8/25.
//  Copyright © 2016年 冉俊. All rights reserved.
//

import UIKit


/// 学院头条View

class MMInstNewsView: BaseCoustomView {
    
    private var instIcon: UIImageView!
    private var newsLabelOne: UILabel!
    private var newsLabelTwo: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    private func comonInit() {
        
        instIcon = UIImageView(image: UIImage(named: "nav_home_pre"))
        self.addSubview(instIcon)
        
        let line = UILabel()
        line.backgroundColor = UIColor.rj_ColorHex("c6c6c6")
        self.addSubview(line)
        
        newsLabelOne = UILabel()
        newsLabelOne.textColor = UIColor.rj_ColorHex("333333")
        newsLabelOne.textAlignment = .Left
        newsLabelOne.font = UIFont.systemFontOfSize(12)
        self.addSubview(newsLabelOne)
        
        newsLabelTwo = UILabel()
        newsLabelTwo.textColor = UIColor.rj_ColorHex("333333")
        newsLabelTwo.textAlignment = .Left
        newsLabelTwo.font = UIFont.systemFontOfSize(12)
        self.addSubview(newsLabelTwo)
        
        instIcon.snp.makeConstraints { (make) in
            make.left.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.width.equalTo(instIcon.snp.height)
        }
        
        line.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(instIcon)
            make.centerY.equalTo(instIcon)
            make.left.equalTo(instIcon.snp.right).offset(10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
