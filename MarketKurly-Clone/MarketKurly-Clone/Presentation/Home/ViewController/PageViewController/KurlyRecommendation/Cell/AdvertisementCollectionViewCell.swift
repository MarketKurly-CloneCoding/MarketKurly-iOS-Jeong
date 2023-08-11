//
//  AdvertisementCollectionViewCell.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

import SnapKit
import Then

final class AdvertisementCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let advertisementImageView = UIImageView()
    
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

extension AdvertisementCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        advertisementImageView.do {
            $0.image = Image.image1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(advertisementImageView)
        
        advertisementImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods

}
