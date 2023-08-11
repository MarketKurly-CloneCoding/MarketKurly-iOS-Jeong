//
//  ProductHeaderView.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

class ProductHeaderView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let headerTitleLabel = UILabel()
    private let allProductButton = UIButton()
    
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

extension ProductHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        
        headerTitleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .regular)
            $0.textColor = Color.black
        }
        
        allProductButton.do {
            $0.setTitle("전체보기 >", for: .normal)
            $0.setTitleColor(Color.mainPurple, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(headerTitleLabel, allProductButton)
        
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        allProductButton.snp.makeConstraints {
            $0.top.equalTo(headerTitleLabel)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
