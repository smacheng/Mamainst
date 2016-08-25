//
//  MMClassificationCell.swift
//  Mamainst
//
//  Created by hd-apple20 on 16/8/25.
//  Copyright © 2016年 冉俊. All rights reserved.
//

import UIKit

class MMClassificationCell: BaseCollectionViewCell {

    private var classIcon: UIImageView!
    private var classTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        classIcon = UIImageView.init()
        classIcon.image = UIImage.init(named: "btn_my_defaulthead")
        self.addSubview(classIcon)
        
        classTitle = UILabel.init()
        classTitle.textAlignment = .Center
        classTitle.textColor = UIColor.rj_ColorHex("666666")
        classTitle.font = UIFont.systemFontOfSize(12)
        classTitle.text = "亲子关系"
        self.addSubview(classTitle)
        
        classIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY).offset(-5)
            make.centerX.equalTo(self.snp.centerX)
        }
        classTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(classIcon.snp.centerX)
            make.top.equalTo(classIcon.snp.bottom).offset(5)
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
