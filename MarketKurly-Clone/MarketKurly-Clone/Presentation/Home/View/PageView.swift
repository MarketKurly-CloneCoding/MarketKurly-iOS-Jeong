//
//  MenuView.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/06.
//

import UIKit

import SnapKit
import Then

final class PageView: UIView {
    
    // MARK: - UI Components
    
    private let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return vc
    }()
    
    // MARK: - Properties
    
    private var menuTitleModel: [HomeMenuModel] = HomeMenuModel.homeMenuData()
    private var menuVCs: [UIViewController] = []
    var nowIndex: Int = 0 {
        didSet {
            pageBind(oldValue: oldValue, newValue: nowIndex)
        }
    }
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nowIndex = 0
        setUI()
        setLayout()
        setDelegate()
        setRegister()
        setCollectionViewCell()
        setPageViewController()
        setViewControllersInPageVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageView {
    
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
    
        addSubviews(menuCollectionView, pageViewController.view)
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        pageViewController.dataSource = self
        pageViewController.delegate = self
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
    
    private func setViewControllersInPageVC() {
        if let firstVC = menuVCs.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func setPageViewController() {
        menuVCs += [KurlyRecommendationViewController()]
        menuVCs += [NewProductViewController()]
        menuVCs += [BestViewController()]
        menuVCs += [ThriftyShoppingViewController()]
        menuVCs += [SpecialsViewController()]
    }
    
    private func pageBind(oldValue: Int, newValue: Int) {
        let direction: UIPageViewController.NavigationDirection = oldValue < newValue ? .forward : .reverse
        pageViewController.setViewControllers([menuVCs[nowIndex]], direction: direction, animated: true)
        menuCollectionView.selectItem(at: IndexPath(item: nowIndex, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private func didTapCell(at indexPath: IndexPath) {
        nowIndex = indexPath.item
    }
    
    private func setCollectionViewCell() {
        menuCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .centeredVertically)
    }
    
    // MARK: - @objc Methods
}

extension PageView: UICollectionViewDataSource {
    
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

extension PageView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = SizeLiterals.Screen.screenWidth * CGFloat(labelWidthSize(index: indexPath.row) + 20) / 375
        let height = CGFloat(44)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func  collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentVC = menuVCs[indexPath.row]
        let currentIndex = menuVCs.firstIndex(of: currentVC)!
        pageBind(oldValue: currentIndex, newValue: nowIndex)
        didTapCell(at: indexPath)
        
        let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell
        cellUnderLineSetting(cell: cell, indexPath: indexPath, selected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell
        cellUnderLineSetting(cell: cell, indexPath: indexPath, selected: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let myCell = cell as? MenuCollectionViewCell {
            myCell.underLine.isHidden = !myCell.isSelected
            myCell.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
        }
    }
}

extension PageView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = menuVCs.firstIndex(of: currentVC) else { return }
        nowIndex = currentIndex
        print(currentIndex)
    }
}

extension PageView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = menuVCs.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return menuVCs[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = menuVCs.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == menuVCs.count {
            return nil
        }
        return menuVCs[nextIndex]
    }
}
