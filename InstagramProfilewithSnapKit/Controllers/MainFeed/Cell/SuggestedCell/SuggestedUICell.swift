//
//  SuggestedUICell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 6.06.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension SuggestedCell {
    func setupSuggestedCell(){
        self.selectionStyle = .none
        setupSuperStackView()
        setupSuggestedView()
        setupColletionView()
    }
    fileprivate func  setupSuperStackView(){
        superStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 0, view: contentView)
        superStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    fileprivate func  setupSuggestedView(){
        superStackView.addArrangedSubview(suggestedView)
        suggestedView.addSubViews(views: [suggestedLabel,suggestedButton])
        suggestedButton.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview().inset(8)
        }
        suggestedLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.center.equalToSuperview()
            make.left.equalToSuperview().inset(8)
            make.right.greaterThanOrEqualTo(suggestedButton).inset(8).priorityMedium()
        }
        suggestedButton.setTitle("See All", for: .normal)
        suggestedButton.setTitleColor(UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0), for: .normal)
        suggestedLabel.text = "Suggested for You"
        suggestedLabel.font = UIFont.boldSystemFont(ofSize: 17)
    }
    fileprivate func setupColletionView(){
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        suggestedCollectionView.setCollectionViewLayout(layout, animated: true)
        suggestedCollectionView.delegate = self
        suggestedCollectionView.dataSource = self
        suggestedCollectionView.showsHorizontalScrollIndicator = false
      //  suggestedCollectionView.isPagingEnabled = true
        suggestedCollectionView.backgroundColor = .clear
        suggestedCollectionView.register(SuggestedCVCell.self, forCellWithReuseIdentifier: SuggestedCVCell.identifier)
        let view = UIView()
        superStackView.addArrangedSubview(view)
        view.addSubview(suggestedCollectionView)
       suggestedCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(230)
        }
    }
    }

