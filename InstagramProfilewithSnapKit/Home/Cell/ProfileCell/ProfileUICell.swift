//
//  ProfileUICell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 24.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
enum profileEnum : Int {
    case myProfile = 0
    case othersProfile
    case followingProfile
}
extension ProfileCell {
    func setupStacView(){
        self.selectionStyle = .none
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(10)
        }
        setupSubStackView()
    }
    func setupSubStackView(){
        substackView.axis = .horizontal
        substackView.alignment = .fill
        substackView.distribution = .fill
        substackView.addArrangedSubview(addImageView())
        substackView.addArrangedSubview(userInfoStackView)
        stackView.addArrangedSubview(substackView)
        stackView.addArrangedSubview(addNameLabel())
        stackView.addArrangedSubview(addBioLabel())
        if profileType != .myProfile {
            stackView.addArrangedSubview(addFollowerLabel())
        }
        stackView.addArrangedSubview(addView(titleImage: nil, isFollow: profileType))
        
        infoStackView()
    }
    func infoStackView(){
        userInfoStackView.axis = .horizontal
        userInfoStackView.alignment = .fill
        userInfoStackView.distribution = .fillEqually
        userInfoStackView.addArrangedSubview(addPostView())
        userInfoStackView.addArrangedSubview(addFollowersView())
        userInfoStackView.addArrangedSubview(addFollowingView())
    }
    func addImageView()->UIView{
        let view = UIView()
        userImage.image = UIImage(named: "profileIcon")
        userImage.clipsToBounds = true
        view.addSubview(userImage)
        userImage.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(8)
            make.size.width.height.equalTo(100)
        }
        if profileType == .myProfile {
            let button = UIButton()
            button.setImage(UIImage(named: "add"), for: .normal)
            view.addSubview(button)
            button.snp.makeConstraints { (make) in
                make.width.height.equalTo(25)
                make.trailing.equalTo(userImage.snp.trailing).inset(2)
                make.bottom.equalTo(userImage.snp.bottom).inset(2)
            }
        }
        
        return view
    }
    func addPostView()->UIView{
        let view = UIView()
        view.addSubview(userPosts)
        //userPosts.setTitle("2\nPosts", for: .normal)
        userPosts.titleLabel?.lineBreakMode = .byWordWrapping
        userPosts.titleLabel?.numberOfLines = 2
        userPosts.titleLabel?.textAlignment = .center
        userPosts.addAttributes(title: "2", subTitle: "\nPosts")
        userPosts.snp.makeConstraints { (make) in
           make.edges.equalTo(view)
        }
        return view
    }
    func addFollowersView()->UIView{
        let view = UIView()
       // userFollowers.setTitle("100\nFollowers", for: .normal)
        userFollowers.titleLabel?.lineBreakMode = .byWordWrapping
        userFollowers.titleLabel?.numberOfLines = 2
        userFollowers.titleLabel?.textAlignment = .center
        userFollowers.addAttributes(title: "100", subTitle: "\nFollowers")
        view.addSubview(userFollowers)
        userFollowers.snp.makeConstraints { (make) in
           make.edges.equalTo(view)
        }
        return view
    }
    func addFollowingView()->UIView{
        let view = UIView()
       // userFollowing.setTitle("120\nFollowing", for: .normal)
        userFollowing.titleLabel?.lineBreakMode = .byWordWrapping
        userFollowing.titleLabel?.numberOfLines = 2
        userFollowing.titleLabel?.textAlignment = .center
        userFollowing.addAttributes(title: "120", subTitle: "\nFollowing")
        view.addSubview(userFollowing)
        userFollowing.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        return view
    }
    func addNameLabel()->UIView{
        let view = UIView()
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.text = "Tolga İskender"
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
        return view
    }
    func addBioLabel()->UIView{
        let view = UIView()
        bioLabel.numberOfLines = 0
        bioLabel.font = UIFont(name: "HelveticaNeue-Light" , size: 15)
        bioLabel.text = "IOS Developer\nToronto "
        view.addSubview(bioLabel)
        bioLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
        return view
    }
    func addFollowerLabel()->UIView{
        let view = UIView()
        followerLabel.numberOfLines = 0
        followerLabel.addAttributes(text: "Followed by", mutualFollower1: " user1", mutualFollower2: " user2", otherMutuals: " 4 others")
        view.addSubview(followerLabel)
        followerLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
        return view
    }
    func addView(titleImage:UIImage?,isFollow:profileEnum)->UIView{
        let view = UIView()
        view.snp.makeConstraints { (make) in
            make.size.height.equalTo(50)
        }
        switch isFollow {
        case .followingProfile:
           setupButtons(view: view, isFollow: isFollow)
        case .othersProfile:
            setupButtons(view: view, isFollow: isFollow)
        case .myProfile:
            setupButtons(view: view, isFollow: isFollow)
        }
        return view
    }
}
extension UIButton {
    func addAttributes(title:String,subTitle:String){
        let attrString = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17) ]
        let titleString = NSMutableAttributedString(string: title, attributes: attrString )
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light" , size: 15)! ]
        let subTitleString = NSMutableAttributedString(string: subTitle, attributes: myAttribute )
        titleString.append(subTitleString)
        self.setAttributedTitle(titleString, for: .normal)
    }
    
}
extension UILabel {
    func addAttributes(text:String?,mutualFollower1:String?,mutualFollower2:String?,otherMutuals:String?){
        let attrString = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        let mutualFollower1 = NSMutableAttributedString(string: mutualFollower1 ?? "", attributes: attrString )
        let mutualFollower2 = NSMutableAttributedString(string: mutualFollower2 ?? "", attributes: attrString )
        let otherMutuals = NSMutableAttributedString(string: otherMutuals ?? "", attributes: attrString )
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light" , size: 15)! ]
        let text = NSMutableAttributedString(string: text ?? "", attributes: myAttribute )
        let comma = NSMutableAttributedString(string: ",", attributes: myAttribute )
        let and = NSMutableAttributedString(string: " and", attributes: myAttribute )
        text.append(mutualFollower1)
        text.append(comma)
        text.append(mutualFollower2)
        text.append(and)
        text.append(otherMutuals)
        self.attributedText = text
    }
}
extension UIView {
    func addBorder(borderWith:CGFloat,cornerRadius:CGFloat){
        self.layer.borderWidth = borderWith
        self.layer.cornerRadius = cornerRadius
        if traitCollection.userInterfaceStyle == .dark {
            self.layer.borderColor = UIColor.white.cgColor
        } else {
            self.layer.borderColor = UIColor.black.cgColor
        }
    }
}
extension ProfileCell {
    func setupButtons(view:UIView,isFollow:profileEnum){
        if isFollow == .myProfile {
            let button = UIButton()
            let subview = UIView()
            subview.layer.borderWidth = 0.2
            subview.layer.cornerRadius = 4
            subview.addBorder(borderWith: 0.1,cornerRadius: 4)
            button.setTitle("Edit Profile", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            subview.addSubview(button)
            view.addSubview(subview)
            subview.snp.makeConstraints { (make) in
                make.bottom.top.equalTo(view).inset(10)
                make.left.right.equalTo(view).inset(10)
            }
            button.snp.makeConstraints { (make) in
                make.edges.equalTo(view)
            }
            return
        }
        
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 6
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        let followView = UIView()
        followView.addBorder(borderWith: 0.1, cornerRadius: 4)
        stackView.addArrangedSubview(followView)
        let button = UIButton()
        followView.addSubview(button)
        if isFollow == .followingProfile {
            button.setTitle("Following", for: .normal)
            let imageView = UIImageView()
            imageView.image = UIImage(named: "down-arrow")
            if traitCollection.userInterfaceStyle == .dark {
                imageView.tintColor = .white
            } else {
                imageView.tintColor = .black
            }
            followView.addSubview(imageView)
            imageView.snp.makeConstraints { (make) in
                make.height.width.equalTo(8)
                make.left.equalTo(button.snp.right).offset(2)
                make.centerY.equalTo(button).offset(1)
            }
        } else if isFollow == .othersProfile {
            button.setTitle("Follow", for: .normal)
            followView.backgroundColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
        }

        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        followView.snp.makeConstraints { (make) in
            make.width.equalTo(0.48*(contentView.frame.size.width)).priority(999)
        }
        let messageView = UIView()
        messageView.addBorder(borderWith: 0.1, cornerRadius: 4)
        stackView.addArrangedSubview(messageView)
        let messageButton = UIButton()
        messageButton.setTitle("Message", for: .normal)
        messageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        messageView.addSubview(messageButton)
        messageButton.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        messageView.snp.makeConstraints { (make) in
            make.width.equalTo(0.48*(contentView.frame.size.width)).priority(998)
        }
        let downView = UIView()
        let downImageView = UIImageView()
        downImageView.image = UIImage(named: "down-arrow")
        if traitCollection.userInterfaceStyle == .dark {
            downImageView.tintColor = .white
        } else {
            downImageView.tintColor = .black
        }
        downView.addSubview(downImageView)
        downImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(8)
        }
        downView.addBorder(borderWith: 0.1, cornerRadius: 4)
        stackView.addArrangedSubview(downView)
        downView.snp.makeConstraints { (make) in
            make.width.equalTo(0.12*(contentView.frame.size.width)).priority(997)
        }
    }
}

