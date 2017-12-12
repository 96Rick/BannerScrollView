//
//  ViewController.swift
//  demo
//
//  Created by Rick on 2017/12/11.
//  Copyright © 2017年 Rick. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var fatherView: UIView?
    var bannerScrollView: BannerScrollView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.white
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        
        let imgs = ["1", "2", "3", "w", "2", "4"]
        let desc = ["1", "2", "3", "4", "5", "6"]
        bannerScrollView = BannerScrollView(frame: frame, type: .LOCAL, imgs: imgs, descs: desc, defaultDotImage: UIImage(named: "default"), currentDotImage: UIImage(named: "select"))
        bannerScrollView?.delegate = self
        
        bannerScrollView?.autoScrollInterval = 1.5
        bannerScrollView?.pageControlPointSpace = 100
        
        
        self.view.addSubview(bannerScrollView!)
        
    }
    
}

extension ViewController: BannerScrollViewDelegate {
    func bannerScrollViewDidSelect(at index: Int, bannerScrollView: BannerScrollView) {
        print("点击了第\(index + 1)个图片")
    }
    
    func bannerScrollViewDidScroll(to index: Int, bannerScrollView bannerView: BannerScrollView) {
        print("滑倒了第\(index + 1)个图片")
    }
    
    
}





