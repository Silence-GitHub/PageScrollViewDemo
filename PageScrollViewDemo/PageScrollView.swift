//
//  PageScrollView.swift
//  PageScrollViewDemo
//
//  Created by Kaibo Lu on 2017/3/7.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class PageScrollView: UIScrollView, UIScrollViewDelegate {
    
    var interactionAreaNotInBounds: [CGRect] = [] // Use bounds coordinate system
    var interactionAreaNotInBoundsForOC: [NSValue] = [] { // For Objective-C
        willSet {
            interactionAreaNotInBounds = newValue.map { $0.cgRectValue }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        clipsToBounds = false
        isPagingEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print(#function, "poiont", point)
        let bounds = self.bounds
        let areas = interactionAreaNotInBounds.map { (rect) -> CGRect in
            return CGRect(x: bounds.minX + rect.minX,
                          y: bounds.minY + rect.minY,
                          width: rect.width,
                          height: rect.height)
        }
        for area in areas where area.contains(point) {
            for subview in subviews {
                let convertedPoint = convert(point, to: subview)
                if let view = subview.hitTest(convertedPoint, with: event) {
                    print(#function, "converted point", convertedPoint)
                    return view
                }
            }
            return self
        }
        return super.hitTest(point, with: event)
    }

}
