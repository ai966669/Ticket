//
//  CoponTableViewHeadView.swift
//  Tickets
//
//  Created by ai966669 on 16/6/13.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit
import SnapKit

class CoponTableViewHeadView: UIView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var imgVCopon: UIImageView!
    var lblRule: UILabel!
    var lblTitle:UILabel!
    var lblSocre:UILabel!
    var heightAll:CGFloat!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func  setValue(aTicket:Ticket){
        addImgVc()
        addLblTitle(aTicket.title)
    }
    func addImgVc() {
        imgVCopon = UIImageView()
        addSubview(imgVCopon)
        imgVCopon.snp_remakeConstraints { (make) -> Void in
            make.left.right.top.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            make.height.equalTo(80)
        }
        imgVCopon.image=UIImage.init(named: "candel.jpg")
    }
    
    func  addLblTitle(txt:String) {
        let txt1 = "ASDFHASDFJLK阿斯兰的放假啦束带结发按数据库里打飞机卡死的积分"
        lblTitle = UILabel()
        lblTitle.font = UIFont.systemFontOfSize(16)
        addSubview(lblTitle)
        let rect = (txt1 as NSString).boundingRectWithSize(CGSizeMake(ScreenW, 200), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:lblTitle.font], context: nil)
        lblTitle.snp_makeConstraints { (make) in
            make.left.right.equalTo(self).inset(UIEdgeInsetsMake(0, 8, 0, 8))
            make.top.equalTo(imgVCopon.snp_bottom)
            make.height.equalTo(0).offset(rect.size.height)
        }
        lblTitle.text=txt
        heightAll = rect.height + 80
        frame = CGRectMake(0, 0, ScreenW,heightAll)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
