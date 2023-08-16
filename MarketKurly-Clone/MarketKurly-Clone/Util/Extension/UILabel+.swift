//
//  UILabel+.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

extension UILabel {
    func addStrikethrough() {
        if let text = self.text {
            let attributedText = NSAttributedString(string: text, attributes: [
                NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue
            ])
            
            self.attributedText = attributedText
        }
    }
}


