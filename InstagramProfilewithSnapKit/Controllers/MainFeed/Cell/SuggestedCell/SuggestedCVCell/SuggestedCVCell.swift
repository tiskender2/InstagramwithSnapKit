//
//  SuggestedCVCell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 6.06.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class SuggestedCVCell: UICollectionViewCell {
    static let identifier = "SuggestedCVCell"
    lazy var backView = UIView()
    lazy var superStackView = UIStackView()
    lazy var imgBackView = UIView()
    lazy var userImageView = UIImageView()
    lazy var closeButton = UIButton()
    lazy var followBackView = UIView()
    lazy var userName = UILabel()
    lazy var suggestedLabel = UILabel()
    lazy var followButton = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSuggestedCVCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeSuggestedCVCell(userArray:ProfileModel) {
        userName.text = userArray.name
        userImageView.image = UIImage(named: userArray.imageName ?? "")
    }
}
