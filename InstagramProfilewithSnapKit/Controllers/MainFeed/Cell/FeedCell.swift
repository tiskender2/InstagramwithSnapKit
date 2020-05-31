//
//  FeedCell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 30.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    static let identifier = "FeedCell"
    var superStackview = UIStackView()
    var titleStackView = UIStackView()
    var imageCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var interactionStackView = UIStackView()
    var likeView = UIView()
    var detailView = UIView()
    var dateView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFeed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension FeedCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   /* override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        imageCollectionView.layoutIfNeeded()
        imageCollectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width , height: 100)
        return imageCollectionView.collectionViewLayout.collectionViewContentSize
    }*/
}
extension FeedCell : UICollectionViewDelegate {
    
}
extension FeedCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}

