//
//  ViewController.swift
//  MutiApp
//
//  Created by 孟若 on 15/9/20.
//  Copyright © 2015年 孟若. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var restList = DataArray().dataArray
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRectMake(0, 0, 320, 568), style: UITableViewStyle.Plain)
        self.view.addSubview(tableView)
        self.navigationItem.title = "女神集中营"
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add ,target: self, action : "addRest")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restList.count
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func addRest(){
        let newVC = AddViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    //
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identiString = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identiString,forIndexPath : indexPath) as? TableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identiString) as? TableViewCell
        }
        
        let rest = restList[indexPath.row]
        cell?.initWith(rest.image, restName: rest.name, restLocation: rest.location,restType: rest.type)
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let callActionHandler = {(action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "无法提供服务", message: "敬请期待" , preferredStyle: UIAlertControllerStyle.Alert)
//            alertMessage.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        
//        let option = UIAlertController(title: nil, message: "What are you goning to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
//        let callAction = UIAlertAction(title: "呼叫 "+phone[indexPath.row], style: UIAlertActionStyle.Default, handler: callActionHandler)//自定义的callActionHandler来响应点击的事件
//        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
//        self.presentViewController(option, animated: true, completion: nil)
//        option.addAction(cancelAction)
//        option.addAction(callAction)
        let detail = DetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)
        detail.restInfo = restList[indexPath.row]

    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .Default, title: "分享", handler: {
            (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            let menu = UIAlertController(title: "分享", message: nil, preferredStyle: .ActionSheet)
            let  cancel = UIAlertAction(title:"取消", style: .Cancel, handler: nil)
            let csdnAction = UIAlertAction(title: "新浪微博", style: .Default, handler: nil)
            menu.addAction(csdnAction)
            menu.addAction(cancel)
            self.presentViewController(menu, animated: true, completion: nil)
        })
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "删除", handler: {
            (action: UITableViewRowAction!,indexPath: NSIndexPath!) -> Void in
            self.restList.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            
        })
        return [deleteAction, shareAction]
    }
    
    
    override func prefersStatusBarHidden() -> Bool { //隐藏上边栏中的电量、信号等信息
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

