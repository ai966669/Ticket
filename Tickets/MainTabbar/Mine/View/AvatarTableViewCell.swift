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
        imageView?.frame=CGRectMake(0, 0, 60, 60)
    }
}
