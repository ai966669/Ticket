//
//  BannerInFirstPage.swift
//  Tickets
//
//  Created by ai966669 on 16/5/3.
//  Copyright © 2016年 ai966669. All rights reserved.
//

import UIKit

class BannerInFirstPage: UIScrollView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    init(frame:CGRect,imgUrls:[NSURL]) {
        super.init(frame:frame)
        self.pagingEnabled=true
        self.scrollEnabled=true
        self.showsVerticalScrollIndicator=false;
        self.showsHorizontalScrollIndicator=false;
        contentSize=CGSizeMake(frame.width*CGFloat(imgUrls.count), frame.height)
        if imgUrls.count >= 1{
        for i in 0...imgUrls.count-1 {
            let imgView=UIImageView.init(frame: CGRectMake(ScreenW*CGFloat(i), 0, frame.width, frame.height))
            imgView.sd_setImageWithURL(imgUrls[i], placeholderImage: UIImage.init(named: "candel.jpg"), completed: { (img, err, _, _) in
                if err != nil{
                    
                }else{
                    
                }
            })
            addSubview(imgView)
        }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
}
