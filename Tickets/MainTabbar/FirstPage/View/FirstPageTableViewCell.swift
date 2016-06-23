//
//  FirstPageTableViewCell.swift
//  Tickets
//
//  Created by ai966669 on 16/5/4.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class FirstPageTableViewCell: UITableViewCell {

    @IBOutlet var imgV: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var btnShop: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setCoupon(aTicket:Ticket) {
        lblTitle.text = aTicket.title
        lblScore.text = "\(aTicket.score)"
        btnShop.layer.masksToBounds=true
        btnShop.layer.borderWidth = 0.75
        btnShop.layer.borderColor = UIColor.TopicColor().CGColor
        btnShop.layer.cornerRadius = 1.5
        imgV.sd_setImageWithURL(NSURL.init(string: aTicket.image), placeholderImage: UIImage.init(named: "test.jpg"))
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
