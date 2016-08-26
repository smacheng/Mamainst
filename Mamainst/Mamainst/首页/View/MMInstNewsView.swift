//
//  MMInstNewsView.swift
//  Mamainst
//
//  Created by 冉俊 on 16/8/25.
//  Copyright © 2016年 冉俊. All rights reserved.
//

import UIKit


protocol MMInstNewsViewDelegate {
    func instNewsView(MMInstNewsView: UIView, didSelectItemAtIndex index: Int)
}


/// 学院头条View

class MMInstNewsView: BaseCoustomView {
    
    private var instIcon: UIImageView!
    private var newsLabelOne: UILabel!
    private var newsLabelTwo: UILabel!
    private var viewAnimation: UIView!
    private var timer: NSTimer!
    private var num: Int!
    var delegate: MMInstNewsViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        
        
        
        
        
        comonInit()
        
        
        
        
    }
    
    private func comonInit() {
        
        
        
        instIcon = UIImageView(image: UIImage(named: "nav_home_pre"))
        self.addSubview(instIcon)
        
        let line = UILabel()
        line.backgroundColor = UIColor.rj_ColorHex("c6c6c6")
        self.addSubview(line)
        
        viewAnimation = UIView()
        self.addSubview(viewAnimation)
        
        newsLabelOne = UILabel()
        newsLabelOne.textColor = UIColor.rj_ColorHex("333333")
        newsLabelOne.textAlignment = .Left
        newsLabelOne.font = UIFont.systemFontOfSize(12)
        newsLabelOne.text = "暂无新闻"
        viewAnimation.addSubview(newsLabelOne)
        
        let tap = UIGestureRecognizer.init(target: self, action: #selector(MMInstNewsView.tapAction))
        viewAnimation.addGestureRecognizer(tap)
        
        instIcon.snp.makeConstraints { (make) in
            make.left.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.width.equalTo((instIcon.image?.size.height)!)
        }
        
        line.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(instIcon)
            make.centerY.equalTo(instIcon)
            make.left.equalTo(instIcon.snp.right).offset(10)
        }
        
        viewAnimation.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(line.snp.right).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
        }
        
        newsLabelOne.snp.makeConstraints { (make) in
            make.size.centerX.centerY.equalTo(viewAnimation)
        }
        
    }
    
    
    @objc func tapAction() {
        if num >= datas?.count {
            return
        }
        if (delegate != nil) {
            delegate.instNewsView(self, didSelectItemAtIndex: num)
        }
        
    }
    
    var datas: [String]? {
        didSet {
            num = 0
            if datas?.count != nil {
                newsLabelOne.text = datas![num]
                start()
            }
            
        }
    }
    
    private func start() {
        if ((datas?.count) != nil) {
            if (timer == nil) {
                timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(MMInstNewsView.viewAnimationAction), userInfo: nil, repeats: true)
                NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
            }
        }
    }
    @objc private func viewAnimationAction()  {
        num = num + 1
        if num >= datas?.count {
            num = 0
        }
        
        let animation = CATransition()
        animation.delegate            = self;
        animation.duration            = 0.5
        animation.timingFunction =  CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fillMode            = kCAFillModeForwards;
        animation.removedOnCompletion = true;
        animation.type                = kCATransitionPush;
        animation.subtype             = kCATransitionFromTop;
        animation.fillMode = kCAFillModeBoth
        viewAnimation.layer.addAnimation(animation, forKey: "PushToTop")
        
        newsLabelOne.text = datas![num]
        
    }
    
    
    deinit {
        timer.invalidate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
