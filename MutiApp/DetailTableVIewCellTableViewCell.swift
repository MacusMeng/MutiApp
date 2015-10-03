//
//  DetailTableVIewCellTableViewCell.swift
//  MutiApp
//
//  Created by 孟若 on 15/9/22.
//  Copyright © 2015年 孟若. All rights reserved.
//

import UIKit

class DetailTableVIewCellTableViewCell: UITableViewCell {

    var keyLabel: UILabel!
    var valueLabel: UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        keyLabel = UILabel(frame: CGRectMake(14, 7, 100, 40))
        self.contentView.addSubview(keyLabel)
        valueLabel = UILabel(frame: CGRectMake(100, 4, 184, 40))
        self.contentView.addSubview(valueLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
