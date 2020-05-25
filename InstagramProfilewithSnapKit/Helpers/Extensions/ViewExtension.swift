//
//  ViewExtension.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 25.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

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
