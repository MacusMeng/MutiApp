//
//  NewViewController.swift
//  MutiApp
//
//  Created by 孟若 on 15/9/28.
//  Copyright © 2015年 孟若. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    let identifier = "newCell"
    var imageView:UIImageView!
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
    
    func configureCell(cell:UITableViewCell, indexPath: NSIndexPath){
        let row:NSInteger = indexPath.row
        let nameLabel = UILabel(frame: CGRectMake(10, 5, 200, 15))
        switch row{
        case 0:
            imageView = UIImageView(frame: CGRectMake(0, 0, 320, 250))
            imageView.image = UIImage(named: "photo")
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            cell.addSubview(imageView)
        case 1:
            nameLabel.text = "姓名"
            cell.addSubview(nameLabel)
            let textFiled = UITextField(frame: CGRectMake(10, 20, 250, 40))
            textFiled.placeholder = "你的姓名"
            cell.addSubview(textFiled)
        case 2:
            nameLabel.text = "职业"
            cell.addSubview(nameLabel)
            let textFiled = UITextField(frame: CGRectMake(10, 20, 250, 40))
            textFiled.placeholder = "你的工作"
            cell.addSubview(textFiled)
            
        case 3:
            nameLabel.text = "位置"
            cell.addSubview(nameLabel)
            let textFiled = UITextField(frame: CGRectMake(10, 20, 250, 40))
            textFiled.placeholder = "现在的位置"
            cell.addSubview(textFiled)
        default:
            nameLabel.text = "电话"
            cell.addSubview(nameLabel)
            let textFiled = UITextField(frame: CGRectMake(10, 20, 250, 40))
            textFiled.placeholder = "联系方式"
            cell.addSubview(textFiled)
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "newCell")
        self.configureCell(cell, indexPath: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {//点击行的代理方法
        let row:NSInteger = indexPath.row
        if row == 0{
            self.didClickedImageView()
        }
    }
    func didClickedImageView(){
        let imagePicker = UIImagePickerController() //选择图片
        let isAvailable = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self//代理设为自己
        if isAvailable {
            imagePicker.sourceType = .Camera
        }
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {//保存图片
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
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
