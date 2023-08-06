//
//  MenuView.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/06.
//

import UIKit

import SnapKit
import Then

final class MenuView: UIView {
    
    // MARK: - UI Components
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
        setRegister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        menuCollectionView.do {
            $0.isScrollEnabled = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(menuCollectionView)
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
    
    private func setRegister() {
        menuCollectionView.registerCell(MenuCollectionViewCell.self)
    }
    
    func labelWidthSize(index: Int) -> Int {
        let size = menuTitleModel[index].title.size(
            withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .regular)]).width
        return Int(size)
    }
    
    private func cellUnderLineSetting(cell: MenuCollectionViewCell?, indexPath: IndexPath, selected: Bool) {
        cell?.isSelected = selected
        cell?.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
    }
    
    // MARK: - @objc Methods
}

extension MenuView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitleModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: MenuCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(model: menuTitleModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = SizeLiterals.Screen.screenWidth * 17 / 375
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
}

extension MenuView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = SizeLiterals.Screen.screenWidth * CGFloat(labelWidthSize(index: indexPath.row) + 20) / 375
        let height = CGFloat(44)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func  collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell
        cellUnderLineSetting(cell: cell, indexPath: indexPath, selected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell
        cellUnderLineSetting(cell: cell, indexPath: indexPath, selected: false)
    }
}
