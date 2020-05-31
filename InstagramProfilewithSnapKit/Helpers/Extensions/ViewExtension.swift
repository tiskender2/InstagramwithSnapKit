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
    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
        if let sublayers = layer.sublayers {
            sublayers.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        }

        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isVertical {
            //top to bottom
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //left to right
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    private static let kLayerNameGradientBorder = "GradientBorderLayer"

      func setGradientBorder(
          width: CGFloat,
          colors: [UIColor],
          cornerRadius:CGFloat,
          startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
          endPoint: CGPoint = CGPoint(x: 0.5, y: 1)
      ) {
          let existedBorder = gradientBorderLayer()
          let border = existedBorder ?? CAGradientLayer()
          border.frame = bounds
          border.colors = colors.map { return $0.cgColor }
          border.startPoint = startPoint
          border.endPoint = endPoint

          let mask = CAShapeLayer()
          mask.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
          mask.fillColor = UIColor.clear.cgColor
          mask.strokeColor = UIColor.white.cgColor
          mask.lineWidth = width

          border.mask = mask

          let exists = existedBorder != nil
          if !exists {
              layer.addSublayer(border)
          }
      }


      private func gradientBorderLayer() -> CAGradientLayer? {
          let borderLayers = layer.sublayers?.filter { return $0.name == UIView.kLayerNameGradientBorder }
          if borderLayers?.count ?? 0 > 1 {
              fatalError()
          }
          return borderLayers?.first as? CAGradientLayer
      }
    
}
