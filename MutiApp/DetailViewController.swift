//
//  DetailViewController.swift
//  MutiApp
//
//  Created by 孟若 on 15/9/21.
//  Copyright © 2015年 孟若. All rights reserved.
//

import UIKit
var cgImageView = UIImageView?()
var rest = Rest?()

let  tooBarHeight:CGFloat = 44
let tooBarWidth:CGFloat = 320

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,DetailTableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let tableY:CGFloat = 280
        let tableHeight:CGFloat = 300
        
        let tableView = UITableView(frame: CGRectMake(0, tableY, 320, tableHeight), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        let toolBarY:CGFloat = self.view.frame.size.height - tooBarHeight
        let toolBar = UIToolbar(frame: CGRectMake(0,toolBarY,tooBarWidth,tooBarHeight))
        self.view.addSubview(toolBar)
        
        let shareButton = UIButton(frame: CGRectMake(40, 0, 80, 44))
        shareButton.setTitle("分享", forState: .Normal)
        shareButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        shareButton.addTarget(self, action: "addRest:", forControlEvents: .TouchUpInside)
        shareButton.tag = 101
        toolBar.addSubview(shareButton)
        
        let reviewButton = UIButton(frame: CGRectMake(190, 0, 80, 44))
        reviewButton.setTitle("评论", forState: .Normal)
        reviewButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        reviewButton.addTarget(self, action: "clickReview:", forControlEvents: .TouchUpInside)
        reviewButton.tag = 102
        toolBar.addSubview(reviewButton)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var restInfo :Rest {
        set(newRest){
            if cgImageView == nil {
                cgImageView = UIImageView(frame: CGRectMake(0, 65, 320, 280))
            }
            cgImageView?.image = UIImage(named: newRest.image)
            cgImageView!.contentMode = UIViewContentMode.ScaleAspectFill
            cgImageView!.autoresizingMask = UIViewAutoresizing.FlexibleHeight
            cgImageView!.clipsToBounds  = true
            self.view.addSubview(cgImageView!)
            rest = newRest
            
        }
        get {
            return rest!
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let indentfier = "detailCell"
        let cell = DetailTableViewCell (style: .Default, reuseIdentifier: indentfier)
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "姓名"
            cell.valueLabel.text = rest?.name
        case 1:
            cell.keyLabel.text = "工作"
            cell.valueLabel.text = rest?.type
        case 2:
            cell.keyLabel.text = "位置"
            cell.valueLabel.text = rest?.location
            cell.mapButton.hidden = false
//        case 3:
//            cell.keyLabel.text = "状态"
//            let here = (rest?.isVisit == true) ? "在线" : "不在线"
//            cell.valueLabel.text = here
        case 3:
            cell.keyLabel.text = "电话"
            cell.valueLabel.text = rest?.phone
        default:
            break
        }
        cell.detailDelegate = self 
        return cell
    }
    
    func detailTableView(cell: DetailTableViewCell ) {
        let mapViewController:MapViewController = MapViewController()
        mapViewController.tempRest = rest
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }


}
