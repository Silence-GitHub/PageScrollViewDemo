//
//  ViewController.swift
//  PageScrollViewDemo
//
//  Created by Kaibo Lu on 2017/3/7.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView: PageScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = PageScrollView(frame: CGRect(x: 30, y: 0, width: view.bounds.width - 60, height: 300))
        let width = scrollView.bounds.width
        let height = scrollView.bounds.height
        scrollView.interactionAreaNotInBounds = [CGRect(x: scrollView.bounds.minX - 30,
                                                        y: scrollView.bounds.minY,
                                                        width: 30,
                                                        height: height),
                                                 CGRect(x: scrollView.bounds.maxX,
                                                        y: scrollView.bounds.minY,
                                                        width: 30,
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
    }

}

