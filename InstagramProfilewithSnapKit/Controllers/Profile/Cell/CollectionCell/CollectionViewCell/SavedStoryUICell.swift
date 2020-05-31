//
//  SavedStoryUICell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 25.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension SavedStoryCell {
    func setupSavedStoryCell() {
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.isBaselineRelativeArrangement = true
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        viewImage.addBorder(borderWith: 0.1, cornerRadius: (contentView.frame.size.width)/2)
        stackView.addArrangedSubview(viewImage)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "raptors")
        viewImage.addSubview(imageView)
        viewImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(70)
        }
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(62)
        }
        imageView.layer.cornerRadius = (contentView.frame.size.width-8)/2
        
        let labelView = UIView()
        stackView.addArrangedSubview(labelView)
        label.text = "savedStory"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light" , size: 13)!
        labelView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.bottom.greaterThanOrEqualTo(labelView).inset(20)
        }
    }
    func customizeNewSavedStoryCell(image:UIImage,text:String){
        imageView.image = image
        imageView.contentMode = .center
        if traitCollection.userInterfaceStyle == .dark {
            imageView.tintColor = .white
        } else {
            imageView.tintColor = .black
        }
        label.text = text
    }
    func customizeSavedStoryCell(image:UIImage,text:String){
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        label.text = text
    }
    func customizeFeedStory(image:UIImage,text:String){
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        label.text = text
        viewImage.clipsToBounds = true
        
        if text == "tiskender2"{
            label.addCommentAttributes(text: "Your Story", textSize: 13)
            let view = UIView()
            contentView.addSubview(view)
            view.snp.makeConstraints { (make) in
                make.top.left.equalToSuperview()
                make.width.height.equalTo(viewImage)
            }
            let button = UIButton()
            button.setImage(UIImage(named: "add"), for: .normal)
            view.addSubview(button)
            button.snp.makeConstraints { (make) in
                make.width.height.equalTo(20)
                make.trailing.equalTo(view.snp.trailing).inset(2)
                make.bottom.equalTo(view.snp.bottom).inset(2)
            }
        } else {
            label.font = UIFont(name: "HelveticaNeue-Light" , size: 13)!
            viewImage.setGradientBorder(width: 5, colors: [.orange, .purple, .red], cornerRadius: viewImage.frame.size.width/2)
        }
       // viewImage.applyGradient(isVertical: false, colorArray: [.orange, .purple, .red]
    }
}
