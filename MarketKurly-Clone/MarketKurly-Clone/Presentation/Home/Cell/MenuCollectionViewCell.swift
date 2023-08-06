//
//  MenuCollectionViewCell.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/06.
//

import UIKit

import SnapKit
import Then

final class MenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let underLine = UIView()
    
    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            underLine.isHidden = !isSelected
            if isSelected {
                titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
                titleLabel.textColor = Color.mainPurple
                underLine.backgroundColor = Color.mainPurple
            } else {
                titleLabel.font = .systemFont(ofSize: 15, weight: .regular)
                titleLabel.textColor = Color.gray2
                underLine.backgroundColor = Color.gray2
            }
        }
    }
    
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

extension MenuCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .regular)
            $0.textColor = Color.gray2
            $0.textAlignment = .center
        }
        
        underLine.do {
            $0.backgroundColor = Color.gray2
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(titleLabel, underLine)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        underLine.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(3)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model : HomeMenuModel) {
        titleLabel.text = model.title
    }
    
    func setUnderLineWidth(size: Int) {
        underLine.snp.makeConstraints {
            $0.width.equalTo(size + 20)
        }
    }
}
