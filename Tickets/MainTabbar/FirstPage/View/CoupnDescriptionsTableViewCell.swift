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
        
        if (lblTitle==nil) {
            lblTitle = UILabel.init()
            contentView.addSubview(lblTitle)
            lblTitle.numberOfLines = 0
            lblTitle.snp_makeConstraints { (make) in
                make.left.equalTo(contentView).offset(18)
                make.top.equalTo(contentView)
            }
            lblTitle.setFontAndTextColor(12, aTextcolor: UIColor.SubTextColor())
        }
        
        lblTitle.text = ticketDescription.title
        
        if ((lblContent == nil)) {
            lblContent = UILabel.init()
            contentView.addSubview(lblContent)
            lblContent.numberOfLines = 0
            lblContent.snp_makeConstraints { (make) in
                make.left.equalTo(contentView).offset(18)
                make.top.equalTo(lblTitle.snp_bottom).offset(12)
            }
            lblContent.setFontAndTextColor(12, aTextcolor: UIColor.SubTextColor())
            lblContent.numberOfLines = 0
        }
        lblContent.text = ticketDescription.content

    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
