//
//  BannerProxy.swift
//  demo
//
//  Created by Rick on 2017/12/11.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

// MARK: 数据

// 图片资源
enum ImgSource {
    case SERVER(url: URL)
    case LOCAL(name: String)
}

// 图片类型
enum ImgType: Int {
    case SERVER = 0     // default
    case LOCAL = 1
}

struct Proxy {
    var imgType:ImgType = .SERVER
    var imgArray:[ImgSource] = [ImgSource]()

    subscript (index:Int) -> ImgSource {
        get {
            return imgArray[index]
        }
    }
    
    // 构造方法
    init(type:ImgType, array:[String]) {
        imgType = type
        if imgType == .SERVER {
            imgArray = array.map({ (urlStr) -> ImgSource in
                return ImgSource.SERVER(url: URL(string: urlStr)!)
            })
        } else {
            imgArray = array.map({ (name) -> ImgSource in
                return ImgSource.LOCAL(name: name)
            })
        }
    }
}


// MARK: pageControl
private let PageControlMargin: CGFloat = 15
private let PageControlPointWidth: CGFloat = 2

enum PageControlAliment {
    case CenterBottom
    case RightBottom
    case LeftBottom
}

protocol PageControlAlimentProtocol {
    var pageControlAliment: PageControlAliment { get set }
    var pageControlPointSpace: CGFloat { get set }
    func relayoutPageControl(pageControl: PageControl)
    func relayoutPageControl(pageControl: PageControl, outerFrame: CGRect)
}

extension PageControlAlimentProtocol where Self : UIView {
    func relayoutPageControl(pageControl: PageControl) {
        if pageControl.isHidden == false {
            // MARK: - pageControl的高度 在这里改
            let pageH: CGFloat = 20
            let pageY = bounds.height - pageH
            let pageW = pageControl.pageSize.width
            var pageX: CGFloat = 0
            
            switch self.pageControlAliment {
            case .CenterBottom:
                pageX = CGFloat(self.bounds.width / 2) - pageW * 0.5
            case .RightBottom:
                pageX = bounds.width - pageW - PageControlMargin
            case .LeftBottom:
                pageX = bounds.origin.x + PageControlMargin
            }
            pageControl.frame = CGRect(x:pageX, y:pageY, width:pageW, height:pageH)
        }
    }
    
    func relayoutPageControl(pageControl: PageControl, outerFrame:CGRect)
    {
        if pageControl.isHidden == false {
            pageControl.frame = CGRect(x:outerFrame.origin.x, y:outerFrame.origin.y, width:pageControl.pageSize.width, height:pageControl.pageSize.height)
        }
    }
}


// MARK: 无限轮播
protocol EndlessScrollProtocol {
    
    var isAutoScroll: Bool { get set }
    var autoScrollInterval: Double { get set }
    var timer: Timer? { get set }
    var isEndlessScroll: Bool { get set }
    var endlessScrollTimes: Int { get }
    var itemsInSection: Int { get }
    func setupTimer()
    func changeToFirstBannerCell(animated: Bool, collectionView: UICollectionView)
}

extension EndlessScrollProtocol where Self : UIView {
    func changeBannerCell(collectionView: UICollectionView) {
        guard itemsInSection != 0 else {
            return
        }
    
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let curItem = Int(collectionView.contentOffset.x / flowLayout.itemSize.width)
        if curItem == itemsInSection - 1 {
            let animated = isEndlessScroll ? false : true
            changeToFirstBannerCell(animated: animated, collectionView: collectionView)
        } else {
            let indexPath = IndexPath(item: curItem + 1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .init(rawValue: 0), animated: true)
        }
    }
    
    func changeToFirstBannerCell(animated: Bool, collectionView: UICollectionView) {
        guard itemsInSection != 0 else {
            return
        }
        
        let firstItem = isEndlessScroll ? (itemsInSection / 2) : 0
        let indexPath = IndexPath(item: firstItem, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .init(rawValue: 0), animated: animated)
    }
}























