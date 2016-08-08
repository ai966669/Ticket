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
    let spaceImgVCoponBot:CGFloat = 17
    var lblTitle:UILabel!
    let spaceLblTitleBot:CGFloat = 10
    var lblTime:UILabel!
    let spaceLblTimeBot:CGFloat = 12
    var sperateLineX1: UIView!
    var imgVScore:UIImageView!
    var lblScore:UILabel!
    var lblOriginMoney:UILabel!
    var viewCanBack2Score:TagViewInCouponDetailView!
    var sperateLineX2: UIView!
    
    var heightAll:CGFloat = 0
    init(){
        super.init(frame: CGRectMake(0, 0, ScreenW, 0))
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func  setValue(aTicket:Ticket){
        addImgVCopon(aTicket.image)
        addLblTitle(aTicket.title)
        addLblTime(aTicket.effectiveTime)
        addSperateLineX1()
        addImgVScore()
        addLblScore(aTicket.score)
        addLblOriginMoney(aTicket.price)
        if (aTicket.refundable) {
            addViewCanBack2Score()
        }
        addSperateLineX2()

    }
    
    func addImgVCopon(imgUrlStr:String) {
        imgVCopon = UIImageView()
        addSubview(imgVCopon)
        imgVCopon.snp_remakeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            make.height.equalTo(310)
        }
        imgVCopon.sd_setImageWithURL(NSURL.init(string: imgUrlStr))
        
    }
    
    func  addLblTitle(txt:String) {
        lblTitle = UILabel()
        lblTitle.setFontAndTextColor(15, aTextcolor: UIColor.BlackTextColor())
        addSubview(lblTitle)
        let rect = (txt as NSString).boundingRectWithSize(CGSizeMake(200, 200), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:lblTitle.font], context: nil)
        lblTitle.numberOfLines = 0
        lblTitle.snp_makeConstraints { (make) in
            make.top.equalTo(imgVCopon.snp_bottom).offset(spaceImgVCoponBot)
            make.left.equalTo(18)
        }
        lblTitle.text=txt
        heightAll = 34 + rect.height + heightAll + 120 + 310
    }
    
    func  addLblTime(txt:String) {
        lblTime = UILabel()
        lblTime.setFontAndTextColor(9, aTextcolor: UIColor.SubTextColor())
        addSubview(lblTime)
        lblTime.snp_makeConstraints { (make) in
            make.top.equalTo(lblTitle.snp_bottom).offset(spaceLblTitleBot)
            make.left.equalTo(lblTitle)
        }

        lblTime.text=txt
    }
    
    func addSperateLineX1(){
        sperateLineX1 = UIView()
        sperateLineX1.backgroundColor = UIColor.SeperateLineColor()
        addSubview(sperateLineX1)
        sperateLineX1.snp_makeConstraints { (make) in
            make.top.equalTo(lblTime.snp_bottom).offset(spaceLblTimeBot)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.height.equalTo(1)
        }
    }
    
    func addImgVScore() {
        imgVScore = UIImageView()
        addSubview(imgVScore)
        imgVScore.snp_makeConstraints { (make) in
            make.left.equalTo(lblTitle)
            make.top.equalTo(sperateLineX1).offset(6)
        }
        imgVScore.image = UIImage(named: "scoreicon")
    }
    
    
    func  addLblScore(score:Int) {
        lblScore = UILabel()
        lblScore.setFontAndTextColor(15, aTextcolor: UIColor.TopicColor())
        addSubview(lblScore)
        lblScore.text = "\(score)"
        lblScore.snp_makeConstraints { (make) in
            make.left.equalTo(imgVScore.snp_right).offset(7)
            make.top.equalTo(sperateLineX1).offset(8)
        }
        lblScore.textAlignment = NSTextAlignment.Left
    }
    
    
    func  addLblOriginMoney(money:Double) {
        lblOriginMoney = UILabel()
        addSubview(lblOriginMoney)
        lblOriginMoney.text = "市场参考价：\(money)元"
        lblOriginMoney.setFontAndTextColor(9, aTextcolor: UIColor.SubTextColor())
        lblOriginMoney.snp_makeConstraints { (make) in
            make.left.equalTo(lblTitle)
            make.top.equalTo(imgVScore.snp_bottom).offset(10)
        }
    }
    
    func addViewCanBack2Score() {
        viewCanBack2Score = TagViewInCouponDetailView()
        addSubview(viewCanBack2Score)
        viewCanBack2Score.setText("可换积分")
        viewCanBack2Score.snp_makeConstraints { (make) in
            make.left.equalTo(lblTitle)
            make.top.equalTo(lblOriginMoney.snp_bottom).offset(12)
            make.size.equalTo(viewCanBack2Score.sizeView)
        }
    }
    
    
    func addSperateLineX2(){
        sperateLineX2 = UIView()
        sperateLineX2.backgroundColor = UIColor.SeperateLineColor()
        addSubview(sperateLineX2)
        sperateLineX2.snp_makeConstraints { (make) in
            make.top.equalTo(viewCanBack2Score.snp_bottom).offset(12)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.height.equalTo(1)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
