//
//  AvatarTableViewCell.swift
//  Tickets
//
//  Created by ai966669 on 16/5/15.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {

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
        imageView?.frame=CGRectMake(10, 10, frame.height-20, frame.height-20)
        imageView!.userInteractionEnabled=true
        imageView?.image =  UIImage.init(named: "candel.jpg")
        textLabel?.text=UserModel.shareManager.username
        detailTextLabel?.text="用户id:\(UserModel.shareManager.id)"
    }
}
