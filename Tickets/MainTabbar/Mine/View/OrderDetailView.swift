//
//  OrderDetailView.swift
//  Tickets
//
//  Created by ai966669 on 16/7/4.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class OrderDetailView: UIView {
    var viewBackGround:UIView!
    func setOrder(aOrder:Order){
        initViewSuccess()
        initOrderDetail(aOrder)
    }
    
    func initViewSuccess(){
        viewBackGround = UIView()
        addSubview(viewBackGround)
        viewBackGround.backgroundColor = UIColor.ColorByRGB(245, G: 245, B: 245, A: 1)
        viewBackGround.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(self).inset(UIEdgeInsetsMake(25, 10, 0, 10))
            make.height.equalTo(50)
        }
        let imgIconSuccess = UIImageView.init(image: UIImage.init(named: "exchangesuccessIcon"))
        viewBackGround.addSubview(imgIconSuccess)
        imgIconSuccess.snp_makeConstraints { (make) in
            make.centerX.equalTo(viewBackGround).offset(-50)
            make.centerY.equalTo(viewBackGround)
        }
        let imgLbl = UILabel.init()
        viewBackGround.addSubview(imgLbl)
        imgLbl.snp_makeConstraints { (make) in
            make.left.equalTo(imgIconSuccess.snp_right).offset(10)
            make.centerY.equalTo(imgIconSuccess)
        }
        imgLbl.setFontAndTextColor(20, aTextcolor: UIColor.BlackTextColor())
        imgLbl.text = "交易成功"
    }
    
    func initOrderDetail(aOrder:Order){
        let lblOrderNb = UILabel()
        lblOrderNb.setFontAndTextColor(10, aTextcolor: UIColor.BlackTextColor())
        lblOrderNb.text = aOrder.title
        lblOrderNb.textAlignment = NSTextAlignment.Left
        addSubview(lblOrderNb)
        lblOrderNb.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(viewBackGround.snp_bottom).offset(15)
        }
        lblOrderNb.text = "订单号：\(aOrder.serialId)"
        
        
        let lblScore = UILabel()
        lblScore.setFontAndTextColor(10, aTextcolor: UIColor.BlackTextColor())
        lblScore.text = aOrder.title
        lblScore.textAlignment = NSTextAlignment.Left
        addSubview(lblScore)
        lblScore.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(lblOrderNb.snp_bottom).offset(10)
        }
        lblScore.text = "实付款：\(aOrder.totalScore)"
        
        let LblOrderTime = UILabel()
        LblOrderTime.setFontAndTextColor(10, aTextcolor: UIColor.BlackTextColor())
        LblOrderTime.text = aOrder.title
        LblOrderTime.textAlignment = NSTextAlignment.Left
        addSubview(LblOrderTime)
        LblOrderTime.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(lblScore.snp_bottom).offset(10)
        }
        lblOrderNb.text = "成交时间：\(aOrder.createTime)"

    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
