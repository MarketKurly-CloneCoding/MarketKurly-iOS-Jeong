//
//  TabBarItem.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/07/31.
//

import UIKit

enum TabBarItemType: Int, CaseIterable {
    case home
    case category
    case search
    case mypage
}

extension TabBarItemType {
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .category:
            return "카테고리"
        case .search:
            return "검색"
        case .mypage:
            return "마이컬리"
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .home:
            return Image.selectedHome
        case .category:
            return Image.selectedCategory
        case .search:
            return Image.selectedSearch
        case .mypage:
            return Image.selectedMypage
        }
    }
    
    var unSelectedIcon: UIImage {
        switch self {
        case .home:
            return Image.home
        case .category:
            return Image.category
        case .search:
            return Image.search
        case .mypage:
            return Image.mypage
        }
    }
    
    public func setTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: title,
            image: unSelectedIcon,
            selectedImage: selectedIcon)
    }
}


