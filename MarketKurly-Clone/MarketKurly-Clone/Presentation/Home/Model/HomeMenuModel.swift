//
//  HomeMenuModel.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/06.
//

import UIKit

struct HomeMenuModel {
    let title: String
}

extension HomeMenuModel {
    
    static func homeMenuData() -> [HomeMenuModel] {
        return [
            HomeMenuModel(title: "컬리추천"),
            HomeMenuModel(title: "신상품"),
            HomeMenuModel(title: "베스트"),
            HomeMenuModel(title: "알뜰쇼핑"),
            HomeMenuModel(title: "특가/혜택")
        ]
    }
}
