//
//  ProfileCell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 24.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    var stackView = UIStackView()
    var substackView = UIStackView()
    var userInfoStackView = UIStackView()
    var userImage = UIImageView()
    var userPosts = UIButton()
    var userFollowers = UIButton()
    var userFollowing = UIButton()
    var nameLabel = UILabel()
    var bioLabel = UILabel()
    var followerLabel = UILabel()
    var profileType = profileEnum.othersProfile
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStacView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
