//
//  PageCollectionVC.swift
//  PageScrollViewDemo
//
//  Created by Kaibo Lu on 2017/3/8.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class PageCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private var selectedIndex: Int = 0
    private let cellWidth: CGFloat = UIScreen.main.bounds.width - 100
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = .white
        
        let cellHeight: CGFloat = 100
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        let frame = CGRect(x: 0, y: 74, width: UIScreen.main.bounds.width, height: cellHeight)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    // MARK: - Collection view data source
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        switch indexPath.item {
        case 0:
            cell.contentView.backgroundColor = .red
        case 1:
            cell.contentView.backgroundColor = .green
        default:
            cell.contentView.backgroundColor = .blue
        }
        return cell
    }
    
    // MARK: - Scroll view delegate
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let pageWidth = cellWidth
        let movedX = x -  pageWidth * CGFloat(selectedIndex)
        if movedX < -pageWidth * 0.5 {
            // Move left
            selectedIndex -= 1
        } else if movedX > pageWidth * 0.5 {
            // Move right
            selectedIndex += 1
        }
        if abs(velocity.x) >= 2 {
            targetContentOffset.pointee.x = pageWidth * CGFloat(selectedIndex)
        } else {
            targetContentOffset.pointee.x = scrollView.contentOffset.x
            scrollView.setContentOffset(CGPoint(x: pageWidth * CGFloat(selectedIndex), y: scrollView.contentOffset.y), animated: true)
        }
    }

}
