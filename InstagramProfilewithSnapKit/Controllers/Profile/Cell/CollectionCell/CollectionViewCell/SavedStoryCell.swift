//
//  SavedStoryCell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 25.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class SavedStoryCell: UICollectionViewCell {
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    let viewImage = UIView(frame: CGRect(x: 0, y: 0, width: 70.0, height: 70.0))
    var once = true
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSavedStoryCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
