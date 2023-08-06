//
//  HomeViewController.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/07/31.
//

import UIKit

import Moya
import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let navigationView = CustomNavigationBar()
    private let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // MARK: - Properties
    
    private var menuTitleModel: [HomeMenuModel] = HomeMenuModel.homeMenuData()
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension HomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.white
        
        menuCollectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(navigationView, menuCollectionView)
        
        navigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}