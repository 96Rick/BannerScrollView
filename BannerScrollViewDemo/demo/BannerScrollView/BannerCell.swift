//
//  BannerCell.swift
//  demo
//
//  Created by Rick on 2017/12/11.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import SDWebImage


class BannerCell: UICollectionViewCell {
    
    // MARK: 内部属性
    fileprivate var imgView:UIImageView!
    fileprivate var descLabel:UILabel!
    fileprivate var bottomView:UIView!
    
    // MARK: - 对外方法
    var imgSource:ImgSource = ImgSource.LOCAL(name: "placeholder")  {
        didSet {
            switch imgSource {
            case let .SERVER(url):
                imgView.sd_setImage(with: url)
            case let .LOCAL(name):
                imgView.image = UIImage(named: name)
            }
        }
    }
    
    var placeholderImage: UIImage?
    var descText: String? {
        didSet {
            descLabel.isHidden  = (descText == nil) ? true : false
            bottomView.isHidden = (descText == nil) ? true : false
            descLabel.text = descText
        }
    }
    
    var imageContentModel: UIViewContentMode = .scaleAspectFill {
        didSet {
            imgView.contentMode = imageContentModel
        }
    }
    
    var descLabelFont: UIFont = UIFont(name: "Helvetica-Bold", size: 18)! {
        didSet {
            descLabel.font = descLabelFont
        }
    }
    
    var descLabelTextColor: UIColor = UIColor.white {
        didSet {
            descLabel.textColor = descLabelTextColor
        }
    }
    
    var descLabelHeight: CGFloat = 60 {
        didSet {
            descLabel.frame.size.height = descLabelHeight
        }
    }
    
    var descLabelTextAlignment: NSTextAlignment = .left {
        didSet {
            descLabel.textAlignment = descLabelTextAlignment
        }
    }
    
    var bottomViewBackgroundColor: UIColor = UIColor.black.withAlphaComponent(0.5) {
        didSet {
            bottomView.backgroundColor = bottomViewBackgroundColor
        }
    }
    
    override var frame: CGRect {
        didSet {
            bounds.size = frame.size
        }
    }
    

    // MARK: - initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupImgView()
        setupDescLabel()
        setupBottomView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("BannerCell  deinit")
    }
    
    
    // MARK: layoutSubviews 方法
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.frame = self.bounds
        if let _ = descText {
            
            let margin:CGFloat = 16
            let labelWidth = imgView.bounds.width - 2 * margin
            let labelHeight = descLabelHeight
            let labelY = bounds.height - labelHeight
            descLabel.frame = CGRect(x: margin, y: labelY, width: labelWidth, height: labelHeight)
            bottomView.frame = CGRect(x: 0, y: labelY, width: imgView.bounds.width, height: labelHeight)
            bringSubview(toFront: descLabel)
        }
    }
}


// MARK: - 控件初始化
extension BannerCell {
    
    fileprivate func setupImgView() {
        imgView = UIImageView()
        imgView.contentMode = imageContentModel
        imgView.clipsToBounds = true
        addSubview(imgView)
    }
    
    fileprivate func setupDescLabel() {
        descLabel = UILabel()
        descLabel.text = descText
        descLabel.font = descLabelFont
        descLabel.textColor = descLabelTextColor
        descLabel.frame.size.height = descLabelHeight
        descLabel.textAlignment = descLabelTextAlignment
        descLabel.numberOfLines = 0
        addSubview(descLabel)
        descLabel.isHidden = true
    }
    
    fileprivate func setupBottomView() {
        bottomView = UIView()
        bottomView.backgroundColor = bottomViewBackgroundColor
        addSubview(bottomView)
        bottomView.isHidden = true
    }
}


