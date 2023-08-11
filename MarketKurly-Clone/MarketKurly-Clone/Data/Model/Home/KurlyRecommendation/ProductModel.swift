//
//  ProductModel.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

struct ProductModel {
    let productImage: UIImage
    let name: String
    let price: String
    let salePercent: String?
    let costPrice: String?
    let presentInfo: Bool
}

extension ProductModel {
    
    static func productModelDummyData() -> [ProductModel] {
        return [
            ProductModel(productImage: Image.image1, name: "[YOZM] 플레인 그릭요거트 2종", price: "3510", salePercent: "10", costPrice: "3900", presentInfo: false),
            ProductModel(productImage: Image.image2, name: "[서울우유] 비요뜨 요거트 6종", price: "1330", salePercent: nil, costPrice: nil, presentInfo: false),
            ProductModel(productImage: Image.image3, name: "[매일] 바이오 플레인 요거트 450g 2종", price: "3180", salePercent: nil, costPrice: nil, presentInfo: false)
        ]
    }
}
