//
//  UILabel + CustomLabel.swift
//  Chapter-8-Challenges
//
//  Created by Boris Ezhov on 10.07.2021.
//

import UIKit

extension UILabel {
  static func custom(text: String, fontSize: CGFloat, textAlignment: NSTextAlignment, backgroundColor: UIColor, cornerRadius: CGFloat) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont.systemFont(ofSize: fontSize)
    label.textAlignment = textAlignment
    label.backgroundColor = backgroundColor
    label.layer.cornerRadius = cornerRadius
    label.clipsToBounds = true
    return label
  }
}
