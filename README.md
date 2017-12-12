# BannerScrollView

### 一个封装好的轮播图
## 需要Self提供数据（Pic & Desc 为两个Array）根据数组内元素个数自动生成 PageControl，可以是本地或网络，使用SDWebImage加载，项目中要 Pod 'SDWebImage' 
------

创建：


 
        let imgs = ["1", "2", "3", "w", "2", "4"]
        let desc = ["1", "2", "3", "4", "5", "6"]
        let bannerScrollView = BannerScrollView(
                                            frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300),
                                            type: .LOCAL,
                                            imgs: imgs,
                                            descs: desc,
                                            defaultDotImage: UIImage(named: "default"),
                                            currentDotImage: UIImage(named: "select"),
                                            placeholderImage: UIImage(named: "pic"))
        bannerScrollView.delegate = self
        self.view.addSubview(bannerScrollView)

属性：


         // Default 4s
        bannerScrollView.autoScrollInterval
        
        bannerScrollView.imageContentModel
        
        bannerScrollView.currentDotColor
        bannerScrollView.otherDotColor
        bannerScrollView.currentPageDotImage
        bannerScrollView.defaultPageDotImage
        
        bannerScrollView.descLabelFont
        bannerScrollView.descLabelHeight
        bannerScrollView.descLabelTextAlignment
        bannerScrollView.descLabelTextColor
        // DescLabelBackgroundColor Default Balck, Alpha: 0.5
        bannerScrollView.bottomViewBackgroundColor
        
        bannerScrollView.isAutoScroll
        bannerScrollView.isEndlessScroll
    
        bannerScrollView.outerPageControlFrame
    
        bannerScrollView.pageControlAliment
        bannerScrollView.pageControlPointSpace
        bannerScrollView.placeholderImage
        bannerScrollView.showPageControl
