//
//  RJBannar.swift
//  Mamainst
//
//  Created by 冉俊 on 16/6/18.
//  Copyright © 2016年 冉俊. All rights reserved.
//

import UIKit





    internal var _imageURLArrays = [String]();


class RJBannar: BaseCoustomView {

    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        
    }
    
    convenience init(){
        self.init(frame:CGRect.zero);
        
    }
    
    
    
    
    var  imageURLArrays: NSArray {
        get{
            return _imageURLArrays;
        }
        set{
            _imageURLArrays = newValue as! [String];
            setSubviews();
        }
        
    }
    
    
    func setSubviews() {
        print(_imageURLArrays);
    
    }

    
    internal lazy var scrollview:UIScrollView = {
        let scrollview = UIScrollView.init();
        
        return scrollview;
    }()
    
    
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
