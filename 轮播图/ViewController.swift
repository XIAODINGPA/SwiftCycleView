//
//  ViewController.swift
//  轮播图
//
//  Created by AoRun on 2018/6/21.
//  Copyright © 2018年 陈永发. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{
    var sv :UIScrollView!
    var pageControl : UIPageControl!
    var newImageColorArray : Array<UIColor>!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建滚动视图
        //获取屏幕宽度
        let screenW =  UIScreen.main.bounds.size.width
        //轮播图高度
        let svHeight = screenW * 9 / 16;
        //滚动视图
        sv = UIScrollView()
        sv.backgroundColor = UIColor.lightGray
        sv.frame = CGRect.init(x: 0, y: 100, width:screenW , height: svHeight)
        sv.delegate = self
        sv.isPagingEnabled = true //设置滚动视图分页效果，即滑动屏幕,页面偏移一个屏幕宽度
        view.addSubview(sv)
     
        //原颜色数组
        let imageColorArray = [
            UIColor.orange,
            UIColor.blue,
            UIColor.red,
            UIColor.lightGray,
            UIColor.cyan
        ]
        
       //创建新的颜色数组 为了实现循环播放
        newImageColorArray = Array<UIColor>()
        //将imageColorArray 的元素添加到 newImageColorArray数组中
        for index in 0...imageColorArray.count - 1
        {
            newImageColorArray.append(imageColorArray[index])
        }
        
        // 获取imageColorArray的第一个元素 插入到 newImageColorArray数组最后一位
        newImageColorArray.append(imageColorArray.first!)
        //获取imageColorArray的最后一个元素 插入到 newImageColorArray数组第一位
        newImageColorArray.insert(imageColorArray.last!, at: 0)

       
        //设置滚动区域  水平滚动
        sv.contentSize = CGSize.init(width:CGFloat(newImageColorArray.count) * screenW, height: svHeight)
//        //设置滚动视图偏移一个屏幕宽度
//        sv.setContentOffset(CGPoint.init(x:screenW, y: 0), animated: true)

        for index in 0...newImageColorArray.count - 1
        {
            let imagView = UIImageView.init()
            let imageViewX = CGFloat(index) * screenW
                imagView.frame = CGRect.init(x:imageViewX, y: 0, width: screenW, height: svHeight)
                imagView.isUserInteractionEnabled = true
                imagView.backgroundColor  = newImageColorArray[index]
                sv.addSubview(imagView)
            let label = UILabel.init()
            label.frame = CGRect.init(x: 0, y: 0, width: 100, height: 20)
            label.center = imagView.center
            label.textAlignment = NSTextAlignment.center
            label.text = "第\(index )张"
            label.textColor = UIColor.white
            label.font = UIFont.boldSystemFont(ofSize: 18)
            sv.addSubview(label)
            
         
            
        }
        //增加指示小圆点
        pageControl = UIPageControl.init(frame: CGRect.init(x: screenW/2 - 100/2, y:100 + svHeight - 40, width: 100, height: 40))
        pageControl.numberOfPages = imageColorArray.count //设置小圆点个数
        pageControl.currentPage = 0;//当前选中的页码
        pageControl.currentPageIndicatorTintColor = UIColor.white//当前选中小圆点的颜色
        pageControl.pageIndicatorTintColor = UIColor.green//未被选中是小圆点的颜色
        view.addSubview(pageControl)
        
     
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let offsetX = scrollView.contentOffset.x
        print(offsetX)
        if(offsetX == UIScreen.main.bounds.size.width * CGFloat((newImageColorArray.count  - 1)))
        {
            //更新offset
            scrollView.setContentOffset(CGPoint.init(x: UIScreen.main.bounds.size.width, y: 0), animated: false)
        }else if(offsetX == 0)
        {
            //更新offset
            scrollView.setContentOffset(CGPoint.init(x: UIScreen.main.bounds.size.width * CGFloat((newImageColorArray.count  - 2)) , y: 0), animated: false)
        }
        
       
        let currentPage  = Int( ( offsetX + UIScreen.main.bounds.size.width * 0.5) / UIScreen.main.bounds.size.width )   - 1 ;
        print("currentPage = \(currentPage)")
       
        pageControl.currentPage = currentPage  ;

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

