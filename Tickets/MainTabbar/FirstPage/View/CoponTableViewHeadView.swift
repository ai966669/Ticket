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
    let spaceImgVCoponBot:CGFloat = 10
    var lblTitle:UILabel!
    let spaceLblTitleBot:CGFloat = 10
    var imgVScore:UIImageView!
    var lblScore:UILabel!
    let spaceLblScoreBot:CGFloat = 10
    var lblRuleTime: UILabel!
    
    var heightAll:CGFloat!
    init(){
        super.init(frame: CGRectMake(0, 0, ScreenW, 0))
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func  setValue(aTicket:Ticket){
        addImgVc(aTicket.image)
        addLblTitle(aTicket.title)
        addLblScore(aTicket.score)
    }
    func addImgVc(imgUrlStr:String) {
        imgVCopon = UIImageView()
        addSubview(imgVCopon)
        imgVCopon.snp_remakeConstraints { (make) -> Void in
            make.left.right.top.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            make.height.equalTo(320)
        }
        imgVCopon.sd_setImageWithURL(NSURL.init(string: imgUrlStr))
    }
    
    func  addLblTitle(txt:String) {
        lblTitle = UILabel()
        lblTitle.font = UIFont.systemFontOfSize(16)
        addSubview(lblTitle)
        let rect = (txt as NSString).boundingRectWithSize(CGSizeMake(ScreenW, 200), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:lblTitle.font], context: nil)
        lblTitle.snp_makeConstraints { (make) in
            make.left.right.equalTo(self).inset(UIEdgeInsetsMake(0, 8, 0, 8))
            make.top.equalTo(imgVCopon.snp_bottom)
//            make.height.equalTo(0).offset(rect.size.height)
        }
        lblTitle.text=txt
        heightAll = rect.height + 320
        frame = CGRectMake(0, 0, ScreenW,heightAll)
    }
    
    func addImgVScore() {
        imgVScore = UIImageView()
        imgVScore.backgroundColor = UIColor.blueColor()
        addSubview(imgVScore)
        imgVScore.snp_makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(lblTitle.snp_bottom).offset(10)
            make.size.equalTo(CGSizeMake(30, 40))
        }
    }
    func  addLblScore(score:Int) {
        lblScore = UILabel()
        lblScore.font = UIFont.systemFontOfSize(30)
        lblScore.textColor = UIColor.redColor()
        addSubview(lblScore)
        lblScore.text = "\(score)"
        lblScore.textColor = UIColor.redColor()
        let rect = (lblScore.text == nil ) ? CGRectMake(0, 0, 0, 0) : (lblTitle.text! as NSString).boundingRectWithSize(CGSizeMake(ScreenW, 200), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:lblScore.font], context: nil)
        lblTitle.snp_makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(imgVCopon.snp_bottom).offset(5)
        }
        lblTitle.textAlignment = NSTextAlignment.Left
        heightAll = heightAll + rect.height
        frame = CGRectMake(0, 0, ScreenW,heightAll)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
