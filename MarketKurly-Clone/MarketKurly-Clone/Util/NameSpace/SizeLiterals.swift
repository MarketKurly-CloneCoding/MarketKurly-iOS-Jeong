//
//  SizeLiterals.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/02.
//

import UIKit

struct SizeLiterals {

    struct Screen {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let deviceRatio: CGFloat = screenWidth / screenHeight
    }
}
