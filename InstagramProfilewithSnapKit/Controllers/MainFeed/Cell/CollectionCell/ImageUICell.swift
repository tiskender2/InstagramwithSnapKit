//
//  ImageUICell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 31.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
extension ImageCell {
    func setupImageCell(){
        contentView.addSubview(postImage)
        postImage.clipsToBounds = true
        postImage.image = UIImage(named: "niagara")
        postImage.contentMode = .scaleAspectFill
        postImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
