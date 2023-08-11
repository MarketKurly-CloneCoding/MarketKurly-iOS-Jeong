//
//  PosterCollectionViewCell.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

import SnapKit
import Then

final class PosterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let posterImage = UIImageView()
    
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

extension PosterCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        posterImage.do {
            $0.contentMode = .scaleToFill
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(posterImage)
        
        posterImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: PosterModel) {
        posterImage.image = model.image
    }
}
