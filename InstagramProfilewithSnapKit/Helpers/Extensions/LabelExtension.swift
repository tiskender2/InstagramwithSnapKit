//
//  LabelExtension.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 25.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

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
