//
//  NewViewController.swift
//  MutiApp
//
//  Created by 孟若 on 15/9/28.
//  Copyright © 2015年 孟若. All rights reserved.
//

import UIKit

class NewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let identifier = "newCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        
        //增加一个tableview
        let tableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "newCell")
        self.view.addSubview(tableView)
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "newCell")
        cell.textLabel?.text = "hello"
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let row:NSInteger = indexPath.row
        var rowHeight:CGFloat = 72
        if row == 0
        {
            rowHeight = 250
        }
        return rowHeight
    }
}
