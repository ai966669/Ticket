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
    var lblDescription:UILabel!
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
        initView()
    }
    
    
    
    func initView(){
        lblTitle = UILabel.init()
        contentView.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        let lblTitleNSLayoutConstraintLeft=NSLayoutConstraint.init(item: lblTitle, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        let lblTitleNSLayoutConstraintTop=NSLayoutConstraint.init(item: lblTitle, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 8)

        addConstraint(lblTitleNSLayoutConstraintLeft)
        addConstraint(lblTitleNSLayoutConstraintTop)

        lblTitle.font = UIFont.systemFontOfSize(16)
        lblTitle.textColor = UIColor.blueColor()
        lblTitle.text = "asdffff"

        
        lblDescription = UILabel.init()
        contentView.addSubview(lblDescription)
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        let lblDescriptionNSLayoutConstraintLeft=NSLayoutConstraint.init(item: lblDescription, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 8)
        let lblDescriptionNSLayoutConstraintTop=NSLayoutConstraint.init(item: lblDescription, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: lblTitle, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 8)
        addConstraint(lblDescriptionNSLayoutConstraintLeft)
        addConstraint(lblDescriptionNSLayoutConstraintTop)
        lblDescription.font = UIFont.systemFontOfSize(12)
        lblDescription.textColor = UIColor.blackColor()
        lblDescription.text = "1.描述/n2.描述asdfaf"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
