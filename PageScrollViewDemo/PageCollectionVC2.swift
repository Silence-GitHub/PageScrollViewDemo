//
//  PageCollectionVC2.swift
//  PageScrollViewDemo
//
//  Created by Kaibo Lu on 2017/3/9.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class PageCollectionVC2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    private let cellWidth: CGFloat = 100
    private let cellHeight: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = .white
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        let frame = CGRect(x: 0, y: 74, width: UIScreen.main.bounds.width, height: cellHeight)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    // MARK: - Collection view data source
    
    private let numberOfItems: Int = 30
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        switch indexPath.item {
        case numberOfItems:
            cell.contentView.backgroundColor = .groupTableViewBackground
        case let x where x % 3 == 0:
            cell.contentView.backgroundColor = .red
        case let x where x % 3 == 1:
            cell.contentView.backgroundColor = .green
        default:
            cell.contentView.backgroundColor = .blue
        }
        return cell
    }
    
    // MARK: - Collection view flow layout delegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case numberOfItems:
            let n = Int(UIScreen.main.bounds.width / cellWidth)
            let d = UIScreen.main.bounds.width - cellWidth * CGFloat(n)
            return CGSize(width: d, height: cellHeight)
        default:
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
    // MARK: - Scroll view delegate
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let pageWidth = cellWidth
        var index = Int(x / pageWidth)
        let divideX = CGFloat(index) * pageWidth + pageWidth * 0.5
        if x > divideX {
            index += 1
        }
        targetContentOffset.pointee.x = pageWidth * CGFloat(index)
    }

}
