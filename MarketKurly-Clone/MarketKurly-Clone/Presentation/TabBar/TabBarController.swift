//
//  TabBarController.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/07/31.
//

import UIKit

import SnapKit
import Then

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private var tabs: [UIViewController] = []
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItem()
        setTabBarUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 48
    }
}

extension TabBarController {
    
    private func setTabBarItem() {
        tabs = [
            HomeViewController(),
            CategoryViewController(),
            SearchViewController(),
            MypageViewController()
        ]
        
        TabBarItemType.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.setTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: false)
    }
    
    private func setTabBarUI() {
        UITabBar.clearShadow()
        tabBar.tintColor = Color.mainColor
        tabBar.layer.masksToBounds = false
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = .systemGray5
        tabBar.addSubview(lineView)
        let fontAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .regular)
        ]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
    }
}


