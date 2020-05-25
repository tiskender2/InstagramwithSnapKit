//
//  ButtonExtension.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 25.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

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
