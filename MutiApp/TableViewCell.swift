//
//  TableViewCell.swift
//  MutiApp
//
//  Created by 孟若 on 15/9/21.
//  Copyright © 2015年 孟若. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var nameLabel: UILabel!
    var locationLabel: UILabel!
    var typeLabel: UILabel!
    var thumbnailImageView: UIImageView!
    override   init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initWith(thubnailImage: String, restName: String, restLocation: String, restType: String){
        
        thumbnailImageView.contentMode = UIViewContentMode.ScaleAspectFill
        thumbnailImageView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        thumbnailImageView.clipsToBounds  = true
        thumbnailImageView.image = UIImage(named: thubnailImage)
        nameLabel.text = restName
        locationLabel.text = restLocation
        typeLabel.text = restType
    }
    
    func setupUI(){
        var subFrame = CGRectZero
        //image
        subFrame.origin.x = 15
        subFrame.origin.y = 10
        subFrame.size.width = 60
        subFrame.size.height = 60
        thumbnailImageView = UIImageView(frame: subFrame)
        self.contentView.addSubview(thumbnailImageView)
        //name label
        subFrame.origin.x = 86
        subFrame.origin.y = 9
        subFrame.size.width = 205
        subFrame.size.height = 21
        nameLabel = UILabel(frame: subFrame)
        self.contentView.addSubview(nameLabel)
        //location label
        subFrame.origin.x = 86
        subFrame.origin.y = 30
        locationLabel = UILabel(frame: subFrame)
        self.contentView.addSubview(locationLabel)
        //type label
        subFrame.origin.x = 86
        subFrame.origin.y = 54
        typeLabel = UILabel(frame: subFrame)  
        self.contentView.addSubview(typeLabel)  
    }

}
