//
//  DetailTableViewCell.swift
//  MutiApp
//
//  Created by 孟若 on 15/9/22.
//  Copyright © 2015年 孟若. All rights reserved.
//

import UIKit

protocol DetailTableViewDelegate:NSObjectProtocol {
    func detailTableView(cell:DetailTableViewCell ) ->Void
}

class DetailTableViewCell: UITableViewCell {
    var keyLabel: UILabel!
    var valueLabel: UILabel!
    var mapButton: UIButton!
    var buttonWidth:CGFloat = 40
    var buttonHeight:CGFloat = 30
    var viewWidth:CGFloat = 320
    var detailDelegate:DetailTableViewDelegate!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        keyLabel = UILabel(frame: CGRectMake(20, 7, 100, 40))
        self.contentView.addSubview(keyLabel)
        valueLabel = UILabel(frame: CGRectMake(120, 4, 140, 40))
        valueLabel.numberOfLines = 0 //行数不限
        valueLabel.adjustsFontSizeToFitWidth = true //自适应宽度
        self.contentView.addSubview(valueLabel)
        
        //mapButton
        mapButton = UIButton(frame: CGRectMake(viewWidth - buttonWidth - 20, 7, buttonWidth, buttonHeight))
        mapButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        mapButton.setTitle("地图", forState: .Normal)
        mapButton.hidden = true
        mapButton.addTarget(self, action: "clickMapBtn", forControlEvents: .TouchUpInside)
        self.contentView.addSubview(mapButton)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  clickMapBtn(){
        self.detailDelegate.detailTableView(self)
    }

}
