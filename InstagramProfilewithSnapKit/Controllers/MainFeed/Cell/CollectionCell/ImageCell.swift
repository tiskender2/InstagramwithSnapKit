//
//  ImageCell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 31.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    var postImage = UIImageView()
    static let identifier = "ImageCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
