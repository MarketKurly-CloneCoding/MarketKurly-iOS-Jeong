//
//  PosterModel.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

struct PosterModel {
    let image: UIImage
}

extension PosterModel {
    
    static func posterModelDummyData() -> [PosterModel] {
        return [
            PosterModel(image: Image.homeBanner),
            PosterModel(image: Image.homeBanner),
            PosterModel(image: Image.homeBanner)
        ]
    }
}
