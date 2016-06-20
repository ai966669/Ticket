//
//  CoupnDescriptionsTableViewCell.swift
//  Tickets
//
//  Created by ai966669 on 16/6/12.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class CoupnDescriptionsTableViewCell: UITableViewCell {
    
    var lblTitle:UILabel!
    var lblContent:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
    }
    
    func  setDescription(ticketDescription:TicketDescription!){
        
        lblTitle = UILabel.init()
        contentView.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        
        lblTitle.snp_makeConstraints { (make) in
            make.left.equalTo(contentView).offset(8)
            make.top.equalTo(contentView)
        }
        
        lblTitle.font = UIFont.systemFontOfSize(16)
        lblTitle.textColor = UIColor.blueColor()
        lblTitle.text = ticketDescription.title
        
        
        lblContent = UILabel.init()
        contentView.addSubview(lblContent)
        lblContent.translatesAutoresizingMaskIntoConstraints = false
        
        lblContent.snp_makeConstraints { (make) in
            make.left.equalTo(contentView).offset(8)
            make.top.equalTo(lblTitle.snp_bottom).offset(8)
        }
        lblContent.font = UIFont.systemFontOfSize(12)
        lblContent.textColor = UIColor.blackColor()
        lblContent.numberOfLines = 0
        lblContent.text = ticketDescription.content

    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
