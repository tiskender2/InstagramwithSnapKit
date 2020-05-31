//
//  FeedUICell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 30.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
extension FeedCell {
    func setupFeed(){
        self.selectionStyle = .none
        superStackview.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 4, view: contentView)
        superStackview.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(contentView)
            make.bottom.equalToSuperview().inset(6)
        }
        setupTitleStackView()
        
    }
    fileprivate func setupTitleStackView(){
        let view = UIView()
        view.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        titleStackView.setupStackView(alignment: .center, distribution: .fill, axis: .horizontal, spacing: 8, view: view)
        titleStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        setupTitleStackViewElements(stackview: titleStackView)
        superStackview.addArrangedSubview(view)
        setupColletionView()
        setupInteractionView()
        setupLikeView()
        setupDetailView()
        addCommentView()
        addDateView()
    }
    fileprivate func setupTitleStackViewElements(stackview:UIStackView){
        let userimageView = UIView()
        let usernameView = UIView()
        let userInteractionView = UIView()
        stackview.addArrangedSubview(views: [userimageView,usernameView,userInteractionView])
        
        let userImage = UIImageView()
        userImage.image = UIImage(named: "profileIcon")
        userImage.clipsToBounds = true
        userimageView.addSubview(userImage)
        userImage.snp.makeConstraints { (make) in
            // make.center.equalToSuperview()
            make.top.right.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(8)
            make.width.equalTo(40)
        }
        
        let label = UILabel()
        label.text = "tiskender2"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        usernameView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        moreButton.tintColor = .black
        moreButton.contentMode = .center
        //moreButton.contentHorizontalAlignment = .left
        userInteractionView.addSubview(moreButton)
        moreButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(12)
        }
        
    }
    
    fileprivate func setupColletionView(){
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        imageCollectionView.setCollectionViewLayout(layout, animated: true)
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.showsHorizontalScrollIndicator = false
        imageCollectionView.isPagingEnabled = true
        imageCollectionView.backgroundColor = .clear
        imageCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        let view = UIView()
        superStackview.addArrangedSubview(view)
        view.addSubview(imageCollectionView)
        imageCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    fileprivate func setupInteractionView(){
        let view = UIView()
        superStackview.addArrangedSubview(view)
        interactionStackView.setupStackView(alignment: .fill, distribution: .fillEqually, axis: .horizontal, spacing: 15, view: view)
        interactionStackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(5)
            make.height.equalTo(25)
            make.width.equalTo(90)
        }
        let likeButton = UIButton()
        likeButton.setImage(UIImage(named: "heart"), for: .normal)
        likeButton.contentMode = .scaleAspectFill
        let commentButton = UIButton()
        commentButton.setImage(UIImage(named: "comment"), for: .normal)
        commentButton.contentMode = .scaleAspectFill
        let dmButton = UIButton()
        dmButton.setImage(UIImage(named: "send"), for: .normal)
        dmButton.contentMode = .scaleAspectFill
        interactionStackView.addArrangedSubview(views: [likeButton,commentButton,dmButton])
        
        let favButton = UIButton()
        favButton.setImage(UIImage(named: "fav"), for: .normal)
        favButton.contentMode = .scaleAspectFit
        view.addSubview(favButton)
        favButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(4)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(5)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
    }
    fileprivate func setupLikeView(){
        let label = UILabel()
        label.text = "395 likes"
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 15)
        likeView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().inset(8)
        }
        superStackview.addArrangedSubview(likeView)
    }
    fileprivate func setupDetailView(){
        let label = UILabel()
        label.addDetailAttributes(username: "tiskender2", text: " a picture of awesome niagara falls")
        label.numberOfLines = 0
        label.textAlignment = .left
        detailView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().inset(8)
        }
        superStackview.addArrangedSubview(detailView)
    }
    fileprivate func addCommentView(){
        let view = UIView()
        let label = UILabel()
        label.addCommentAttributes(text: "View all 10 commentes",textSize: 15)
        label.numberOfLines = 1
        label.textAlignment = .left
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().inset(8)
        }
        superStackview.addArrangedSubview(view)
    }
    fileprivate func addDateView(){
        let label = UILabel()
        label.addCommentAttributes(text: "3 hours ago", textSize: 12)
        label.numberOfLines = 1
        label.textAlignment = .left
        dateView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().inset(8)
        }
        superStackview.addArrangedSubview(dateView)
    }
}
