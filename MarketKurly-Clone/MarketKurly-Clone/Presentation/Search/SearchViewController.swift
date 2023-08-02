//
//  SearchViewController.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/07/31.
//

import UIKit

import Moya
import SnapKit
import Then

final class SearchViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let navigationView = CustomNavigationBar()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension SearchViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.white
        
        navigationView.do {
            $0.isLogoIncluded = false
            $0.isNotTitleIncluded = false
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(navigationView)
        
        navigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
