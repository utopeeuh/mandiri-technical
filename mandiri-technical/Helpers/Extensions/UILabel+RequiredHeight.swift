//
//  UILabel+RequiredHeight.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 15/12/22.
//

import Foundation
import UIKit

extension UILabel{
    public var requiredHeight: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.attributedText = attributedText
        label.sizeToFit()
        return label.frame.height
    }
}
