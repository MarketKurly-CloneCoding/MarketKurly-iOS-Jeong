//
//  CustomNavigationBar.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/01.
//

import UIKit

import Moya
import SnapKit
import Then

final class CustomNavigationBar: UIView {
    
    // MARK: - UI Components
    
    private let backgroundView = UIView()
    private let navigationView = UIView()
    private lazy var leftButton = UIButton()
    private let logoImageView = UIImageView()
    private let searchTitleLabel = UILabel()
    private let detailTitleLabel = UILabel()
    private let naviButton = UIButton()
    private let cartButton = UIButton()
    
    // MARK: - Properties
    
    var isNotLeftButtonIncluded: Bool {
        get { !leftButton.isHidden }
        set {
            leftButton.isHidden = !newValue
            backgroundView.backgroundColor = .white
            navigationView.backgroundColor = .white
            cartButton.setImage(Image.cartButton, for: .normal)
        }
    }
    
    var isNotTitleIncluded: Bool {
        get { !searchTitleLabel.isHidden }
        set {
            searchTitleLabel.isHidden = newValue
            detailTitleLabel.isHidden = !newValue
        }
    }
    
    var isLogoIncluded: Bool {
        get { !logoImageView.isHidden }
        set { logoImageView.isHidden = !newValue }
    }
    
    var isNaviIncluded: Bool {
        get { !naviButton.isHidden }
        set { naviButton.isHidden = !newValue }
    }
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomNavigationBar {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundView.do {
            $0.backgroundColor = Color.mainPurple
        }
        
        navigationView.do {
            $0.backgroundColor = Color.mainPurple
        }
        
        leftButton.do {
            $0.setImage(Image.backButton, for: .normal)
            $0.isHidden = true
        }
        
        logoImageView.do {
            $0.image = Image.mainLogo
        }
        
        searchTitleLabel.do {
            $0.text = "검색"
            $0.textColor = Color.white
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.isHidden = true
        }
        
        detailTitleLabel.do {
            $0.text = "[욱이네] 차돌된장찌개"
            $0.textColor = Color.black
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            $0.isHidden = true
        }
        
        naviButton.do {
            $0.setImage(Image.naviMain, for: .normal)
        }
        
        cartButton.do {
            $0.setImage(Image.cartMain, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        navigationView.addSubviews(leftButton, logoImageView, detailTitleLabel,
                                   searchTitleLabel, naviButton, cartButton)
        addSubviews(navigationView, backgroundView)
        
        backgroundView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        leftButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(46)
        }
        
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(62)
            $0.height.equalTo(36)
        }
        
        detailTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        searchTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        cartButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(6)
            $0.size.equalTo(46)
        }
        
        naviButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(cartButton.snp.leading)
            $0.size.equalTo(46)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
