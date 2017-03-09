//
//  PageCollectionVC3.swift
//  PageScrollViewDemo
//
//  Created by Kaibo Lu on 2017/3/9.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class PageCollectionVC3: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var scrollView: PageScrollView!
    private var collectionView: UICollectionView!
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
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        let frame = CGRect(x: 0, y: 74, width: UIScreen.main.bounds.width, height: cellHeight)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        scrollView = PageScrollView(frame: CGRect(x: 0, y: 74, width: cellWidth, height: cellHeight))
        scrollView.interactionAreaNotInBounds = [CGRect(x: scrollView.bounds.maxX,
                                                        y: scrollView.bounds.minY,
                                                        width: UIScreen.main.bounds.width - scrollView.bounds.maxX,
                                                        height: scrollView.bounds.height)]
        scrollView.delegate = self
        let n = Int(UIScreen.main.bounds.width / cellWidth) - 1
        scrollView.contentSize = CGSize(width: cellWidth * CGFloat(numberOfItems - n), height: cellHeight)
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scrollViewTapped(_:))))
        view.addSubview(scrollView)
    }
    
    @objc private func scrollViewTapped(_ tap: UITapGestureRecognizer) {
        let x = tap.location(in: tap.view).x
        let index = Int(x / cellWidth)
        collectionView(collectionView, didSelectItemAt: IndexPath(item: index, section: 0))
    }

    // MARK: - Collection view data source
    
    private let numberOfItems: Int = 6
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
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
    
    // MARK: - Collection view delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, "Index path:", indexPath)
    }
    
    // MARK: - Scroll view delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            collectionView.contentOffset = scrollView.contentOffset
        }
    }

}
