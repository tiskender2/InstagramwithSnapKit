//
//  SuggestedCVUICell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 6.06.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
extension SuggestedCVCell {
    func setupSuggestedCVCell(){
        contentView.addSubview(backView)
        backView.addBorder(borderWith: 0.1, cornerRadius: 5)
        backView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(8)
            make.right.top.equalToSuperview()
        }
        setupStackView()
    }
    fileprivate func setupStackView(){
        superStackView.setupStackView(alignment: .fill, distribution: .fillEqually, axis: .vertical, spacing: 0, view: backView)
        superStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        superStackView.addArrangedSubview(views: [imgBackView,followBackView])
        setupImgBackView()
        setupfollowBackView()
    }
    fileprivate func setupImgBackView(){
        imgBackView.addSubViews(views: [closeButton,userImageView])
        userImageView.clipsToBounds = true
       // userImageView.image = UIImage(named: "followingProfile")
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.width.height.equalTo(10)
        }
        userImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
    }
    fileprivate func setupfollowBackView(){
        followBackView.addSubViews(views: [userName,suggestedLabel,followButton])
        userName.font = UIFont.boldSystemFont(ofSize: 17)
        userName.textAlignment = .center
        //userName.text = "suggested person"
        suggestedLabel.font = UIFont.boldSystemFont(ofSize: 12)
        //suggestedLabel.text = "Suggested for You"
        suggestedLabel.addCommentAttributes(text: "Suggested for You",textSize: 12)
        suggestedLabel.textAlignment = .center
        suggestedLabel.numberOfLines = 2
        followButton.setTitle("Follow", for: .normal)
        followButton.layer.cornerRadius = 4
        followButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        followButton.backgroundColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
        followButton.setTitleColor(.white, for: .normal)
        userName.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(4)
            make.top.equalToSuperview()
           // make.height.equalTo(30)
        }
        suggestedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userName.snp_bottom)
            make.left.right.equalToSuperview().inset(4)
            make.bottom.greaterThanOrEqualTo(followButton.snp_top).offset(-4).priorityLow()
        }
        followButton.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview().inset(8)
          // make.height.equalTo(30)
        }
    }
}
