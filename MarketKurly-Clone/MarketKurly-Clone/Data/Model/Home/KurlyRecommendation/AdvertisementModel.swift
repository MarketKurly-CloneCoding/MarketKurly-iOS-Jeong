//
//  AdvertisementModel.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

struct AdvertisementModel {
    let image: UIImage
}

extension AdvertisementModel {
    
    static func advertisementModelDummyData() -> [AdvertisementModel] {
        return [
            AdvertisementModel(image: Image.image1)
        ]
    }
}
