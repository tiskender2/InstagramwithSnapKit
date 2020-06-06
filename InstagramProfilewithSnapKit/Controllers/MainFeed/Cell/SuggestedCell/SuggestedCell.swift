//
//  SuggestedCell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 6.06.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class SuggestedCell: UITableViewCell {
      static let identifier = "SuggestedCell"
      lazy var superStackView = UIStackView()
      lazy var suggestedView = UIView()
      lazy var suggestedLabel = UILabel()
      lazy var suggestedButton = UIButton()
      lazy var suggestedCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
      var userArray : [ProfileModel]?
      var cellSpace:CGFloat = 2
      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setupSuggestedCell()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
extension SuggestedCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userArray?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestedCVCell.identifier, for: indexPath) as! SuggestedCVCell
        cell.customizeSuggestedCVCell(userArray: userArray?[indexPath.row] ?? ProfileModel())
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpace
    }
}
extension SuggestedCell : UICollectionViewDelegate {
    
}
extension SuggestedCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width*0.4, height: collectionView.frame.size.height)
    }
}
extension SuggestedCell {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth: Float = Float(suggestedCollectionView.frame.width*0.4)+Float(cellSpace)// width + space
        let currentOffset: Float = Float(scrollView.contentOffset.x)
        let targetOffset: Float = Float(targetContentOffset.pointee.x)
        var newTargetOffset: Float = 0
        if targetOffset > currentOffset {
            newTargetOffset = ceilf(currentOffset / pageWidth) * pageWidth
        }
        else {
            newTargetOffset = floorf(currentOffset / pageWidth) * pageWidth
        }
        if newTargetOffset < 0 {
            newTargetOffset = 0
        }
        else if (newTargetOffset > Float(scrollView.contentSize.width)){
            newTargetOffset = Float(Float(scrollView.contentSize.width))
        }
        
        targetContentOffset.pointee.x = CGFloat(currentOffset)
        scrollView.setContentOffset(CGPoint(x: CGFloat(newTargetOffset), y: scrollView.contentOffset.y), animated: true)
    }
    
}
