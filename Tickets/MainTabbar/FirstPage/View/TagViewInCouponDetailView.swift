//
//  TagViewInCouponDetailView.swift
//  Tickets
//
//  Created by ai966669 on 16/6/30.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
import SnapKit

class TagViewInCouponDetailView: UIView {
    var imgVTag:UIImageView!
    var lblTag:UILabel!
    var sizeView:CGSize!
    func  setText(txt:String) {
        imgVTag = UIImageView()
        addSubview(imgVTag)
        imgVTag.snp_remakeConstraints { (make) -> Void in
            make.top.left.bottom.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        imgVTag.image = UIImage(named: "OKIcon")
        lblTag = UILabel()
        lblTag.setFontAndTextColor(11, aTextcolor: UIColor.BlackTextColor())
        addSubview(lblTag)
        lblTag.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            make.left.equalTo(imgVTag.snp_right).offset(6)
        }
        lblTag.text = txt
        let rect = (txt as NSString).boundingRectWithSize(CGSizeMake(200, 16), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName :lblTag.font ], context: nil)
        sizeView = CGSize(width: CGFloat(18)+rect.width,height: 12)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
