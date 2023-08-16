//
//  UIViewController+.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

extension UIViewController {
    var tabBarHeight: CGFloat {
        if let tabBarHeight = self.tabBarController?.tabBar.frame.size.height {
            return tabBarHeight
        }
        return 0
    }
}
