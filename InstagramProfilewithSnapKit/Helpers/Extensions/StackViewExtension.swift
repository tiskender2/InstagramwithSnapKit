//
//  StackViewExtension.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 30.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
extension UIStackView {
    func setupStackView(alignment:Alignment,distribution:Distribution,axis:NSLayoutConstraint.Axis,spacing:CGFloat,view:UIView){
        view.addSubview(self)
        self.alignment = alignment
        self.distribution = distribution
        self.axis = axis
        self.spacing = spacing
        
    }
    func addArrangedSubview(views:[UIView]){
        views.forEach { (view) in
            self.addArrangedSubview(view)
        }
    }
}
