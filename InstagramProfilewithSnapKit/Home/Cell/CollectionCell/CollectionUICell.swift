//
//  CollectionUICell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 25.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
enum CellType : Int {
    case new = 0
    case added
}
extension CollectionCell {
    func setupCollectionCell(model:ProfileModel){
        self.model = model
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        collectionView.register(SavedStoryCell.self, forCellWithReuseIdentifier: "SavedStoryCell")
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    func collectionReloadData(model:ProfileModel){
        self.model = model
        collectionView.reloadData()
    }
}
extension CollectionCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedStoryCell", for: indexPath) as! SavedStoryCell
        if indexPath.item == CellType.new.rawValue && self.model?.profileType == .myProfile {
            cell.customizeNewSavedStoryCell(image: UIImage(named: "plus") ?? UIImage(), text: "New")
        }else {
            cell.customizeSavedStoryCell(image: UIImage(named: "raptors") ?? UIImage(), text: "savedStory")
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
            collectionView.layoutIfNeeded()
            collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width , height: 120)
            return collectionView.collectionViewLayout.collectionViewContentSize
    }
}
extension CollectionCell : UICollectionViewDelegate {
    
}
extension CollectionCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 70, height: 120)
       }
}
