//
//  UITabBar+.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/07/31.
//

import UIKit

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
