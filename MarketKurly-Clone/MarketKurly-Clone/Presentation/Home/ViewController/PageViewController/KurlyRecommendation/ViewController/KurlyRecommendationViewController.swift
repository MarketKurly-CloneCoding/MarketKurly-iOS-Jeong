//
//  KurlyRecommendationViewController.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/06.
//

import UIKit

import Moya
import SnapKit
import Then

final class KurlyRecommendationViewController: UIViewController {
    
    private enum SectionType: CaseIterable {
        case poster, recommended, advertisement, sale
    }
    
    // MARK: - UI Components
    
    private lazy var kurlyRecommendationCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    
    // MARK: - Properties
    
    private let posterModel: [PosterModel] = PosterModel.posterModelDummyData()
    private let productModel: [ProductModel] = ProductModel.productModelDummyData()
    private let advertisementModel: [AdvertisementModel] = AdvertisementModel.advertisementModelDummyData()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setRegister()
    }
}

extension KurlyRecommendationViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = .clear
        
        kurlyRecommendationCollectionView.do {
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = true
            $0.backgroundColor = .clear
            $0.contentInsetAdjustmentBehavior = .never
            $0.collectionViewLayout = self.setSectionLayout()
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(kurlyRecommendationCollectionView)
        
        kurlyRecommendationCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        kurlyRecommendationCollectionView.delegate = self
        kurlyRecommendationCollectionView.dataSource = self
    }
    
    private func setRegister() {
        kurlyRecommendationCollectionView.registerCell(PosterCollectionViewCell.self)
        kurlyRecommendationCollectionView.registerCell(ProductCollectionViewCell.self)
        kurlyRecommendationCollectionView.registerCell(AdvertisementCollectionViewCell.self)
        kurlyRecommendationCollectionView.registerHeader(ProductHeaderView.self)
    }
    
    private func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[section]
            switch sectionType {
            case .poster:
                return self.getLayoutPosterSection()
            case .recommended:
                return self.getLayoutProductSection()
            case .advertisement:
                return self.getLayoutAdvertisementSection()
            case .sale:
                return self.getLayoutProductSection()
            }
        }
    }
    
    private func getLayoutPosterSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(340)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private func getLayoutProductSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .absolute(278)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(70)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16)
        
        return section
    }
    
    private func getLayoutAdvertisementSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(78)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0)
        return section
    }
}

extension KurlyRecommendationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .poster:
            return posterModel.count
        case .recommended:
            return productModel.count
        case .advertisement:
            return advertisementModel.count
        case .sale:
            return productModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster:
            let cell = collectionView.dequeueCell(type: PosterCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: posterModel[indexPath.row])
            return cell
        case .recommended:
            let cell = collectionView.dequeueCell(type: ProductCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: productModel[indexPath.row])
            return cell
        case .advertisement:
            let cell = collectionView.dequeueCell(type: AdvertisementCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: advertisementModel[indexPath.row])
            return cell
        case .sale:
            let cell = collectionView.dequeueCell(type: ProductCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: productModel[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster:
            let view = UICollectionReusableView()
            return view
        case .recommended:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: ProductHeaderView.self, indexPath: indexPath)
            headerView.setHeaderTitle(title: "이 상품 어때요?")
            return headerView
        case .advertisement:
            let view = UICollectionReusableView()
            return view
        case .sale:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: ProductHeaderView.self, indexPath: indexPath)
            headerView.setHeaderTitle(title: "놓치면 후회할 가격")
            headerView.isAllProductButtonIncluded = true
            return headerView
        }
    }
}

extension KurlyRecommendationViewController: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
    }
}
