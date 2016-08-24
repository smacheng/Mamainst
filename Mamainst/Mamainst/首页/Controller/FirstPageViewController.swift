//
//  FirstPageViewController.swift
//  Mamainst
//
//  Created by 冉俊 on 16/6/16.
//  Copyright © 2016年 冉俊. All rights reserved.
//

import UIKit



class FirstPageViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false;
        
        addSubviews();   
    }
    
    // MARK: - addSubview + layout
    
    private func addSubviews() {
        view.addSubview(table);
        addSubviewsLayout();
    }
    
    private func addSubviewsLayout() {
        table.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).inset(64);
            make.left.right.equalTo(view);
            make.bottom.equalTo(view.snp.bottom).inset(49);
        }
    }
    
    
    // MARK: - tableViewDelegate,tableViewDataSourse
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("ID", forIndexPath: indexPath);
            cell.textLabel?.text = "test-\(indexPath.row)";
            
        
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("firstTableViewCell", forIndexPath: indexPath) as! firstTableViewCell;
        
        return cell;
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = bannar;
        if section == 0 {
            
            
            
        }
        
        
        return headerView;
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 100;
        }
        return 0;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        bannar.imageURLArrays = ["\(indexPath.row)","\(indexPath.section)"];
    }
    
    
    // MARK: - lazy
    
    private lazy var table:UITableView = {
        
        let table = UITableView(frame: CGRectMake(0, 0, 0, 0), style: .Plain);
        table.dataSource = self;
        table.delegate = self;
        table.tableFooterView = UIView();

        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "ID")
//        table.registerNib(UINib(nibName: "firstTableViewCell", bundle:nil), forCellReuseIdentifier: "firstTableViewCell")
        
        return table;
    }()
    
    private lazy var bannar:RJBannar = {
        let bannar = RJBannar.init(frame: CGRectMake(0, 0, self.view.frame.size.width, 100));
        return bannar;
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
