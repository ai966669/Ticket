//
//  AvatarTableViewCell.swift
//  Tickets
//
//  Created by ai966669 on 16/5/15.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {
    var imgAvator=UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgAvator.frame=CGRectMake(frame.width-(frame.height-20)-20, 10, frame.height-20, frame.height-20)
        imgAvator.userInteractionEnabled=true
        imgAvator.image =  UIImage.init(named: "test.jpg")
        addSubview(imgAvator)
        imgAvator.layer.cornerRadius=5
        imgAvator.layer.masksToBounds=true
    }
    
}
