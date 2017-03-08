//
//  PageScrollVC.swift
//  PageScrollViewDemo
//
//  Created by Kaibo Lu on 2017/3/7.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class PageScrollVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = .white
        
        let scrollView = PageScrollView(frame: CGRect(x: 125, y: 74, width: view.bounds.width - 250, height: 100))
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.black.cgColor
        let width = scrollView.bounds.width
        let height = scrollView.bounds.height
        scrollView.interactionAreaNotInBounds = [CGRect(x: scrollView.bounds.minX - width * 2,
                                                        y: scrollView.bounds.minY,
                                                        width: width * 2,
                                                        height: height),
                                                 CGRect(x: scrollView.bounds.maxX,
                                                        y: scrollView.bounds.minY,
                                                        width: width * 2,
                                                        height: height)]
        scrollView.contentSize = CGSize(width: width * 3, height: height)
        
        for i in 0..<3 {
            let cell = UIView(frame: CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height))
            scrollView.addSubview(cell)
            
            switch i {
            case 0:
                cell.backgroundColor = .red
            case 1:
                cell.backgroundColor = .green
            default:
                cell.backgroundColor = .blue
            }
        }
        view.addSubview(scrollView)
        
        let scrollView2 = PageScrollView(frame: CGRect(x: 30, y: 300, width: view.bounds.width - 60, height: 50))
        scrollView2.layer.borderWidth = 1
        scrollView2.layer.borderColor = UIColor.black.cgColor
        let width2 = scrollView2.bounds.width
        let height2 = scrollView2.bounds.height
        scrollView2.interactionAreaNotInBounds = [CGRect(x: scrollView2.bounds.minX,
                                                         y: scrollView2.bounds.minY - height2 * 2,
                                                         width: width2,
                                                         height: height2 * 2),
                                                  CGRect(x: scrollView2.bounds.minX,
                                                         y: scrollView2.bounds.maxY,
                                                         width: width2,
                                                         height: height2 * 2)]
        scrollView2.contentSize = CGSize(width: width2, height: height2 * 3)
        
        for i in 0..<3 {
            let cell = UIView(frame: CGRect(x: 0, y: CGFloat(i) * height2, width: width2, height: height2))
            scrollView2.addSubview(cell)
            
            switch i {
            case 0:
                cell.backgroundColor = .red
            case 1:
                cell.backgroundColor = .green
            default:
                cell.backgroundColor = .blue
            }
        }
        view.addSubview(scrollView2)
    }

}

