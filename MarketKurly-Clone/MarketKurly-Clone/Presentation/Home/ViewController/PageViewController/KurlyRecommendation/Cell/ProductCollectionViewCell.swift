//
//  ProductCollectionViewCell.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

import SnapKit
import Then

final class ProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let productImageView = UIImageView()
    private let basketButton = UIButton()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let saleLabel = UILabel()
    private let costPriceLabel = UILabel()
    private let presentLabel = UILabel()
    
    // MARK: - Properties

    private var presentInfo: Bool = false
    
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

extension ProductCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        productImageView.do {
            $0.contentMode = .scaleToFill
        }
        
        basketButton.do {
            $0.setImage(Image.cartButton, for: .normal)
        }
        
        nameLabel.do {
            $0.font = .systemFont(ofSize: 14, weight: .regular)
            $0.textColor = Color.black
            $0.numberOfLines = 0
        }
        
        priceLabel.do {
            $0.font = .systemFont(ofSize: 14, weight: .bold)
            $0.textColor = Color.black
        }
        
        saleLabel.do {
            $0.font = .systemFont(ofSize: 14, weight: .bold)
            $0.textColor = Color.discountColor
            $0.isHidden = true
        }
        
        costPriceLabel.do {
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = Color.gray1
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(productImageView, basketButton, nameLabel,
                    priceLabel, saleLabel, costPriceLabel)
        
        productImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(194)
        }
        
        basketButton.snp.makeConstraints {
            $0.bottom.equalTo(productImageView.snp.bottom).inset(8)
            $0.trailing.equalTo(productImageView.snp.trailing).inset(8)
            $0.size.equalTo(36)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        saleLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalTo(saleLabel.snp.trailing)
            $0.height.equalTo(20)
        }
        
        costPriceLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(16)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: ProductModel) {
        productImageView.image = model.productImage
        nameLabel.text = model.name
        if let salePersent = model.salePercent {
            saleLabel.text = salePersent + "%"
            saleLabel.isHidden = false
        }
        priceLabel.text = model.price.formattedAsCurrency()
        if let costPrice = model.costPrice {
            costPriceLabel.text = costPrice.formattedAsCurrency()
            costPriceLabel.isHidden = false
        }
        if model.presentInfo == true {
            print("선물하기")
        }
    }
}
