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
    
    static func saleModelDummyData() -> [ProductModel] {
        return [
            ProductModel(productImage: Image.image4, name: "[욱이네] 차돌된장찌개", price: "4875", salePercent: "25", costPrice: "6500", presentInfo: false),
            ProductModel(productImage: Image.image1, name: "[뚝방길홍차가게] 시그니처 스콘생지 2종 (4입)", price: "7560", salePercent: "10", costPrice: "8400", presentInfo: false),
            ProductModel(productImage: Image.image2, name: "[미식당] 고구마 치즈롤 돈카츠 150g * 2입 (소스포함)", price: "7663", salePercent: "15", costPrice: "8980", presentInfo: false),
            ProductModel(productImage: Image.image3, name: "[kim's butcher] 냉동 돌돌말이 삼겹살 (스페인) 200g", price: "6990", salePercent: "22", costPrice: "8990", presentInfo: false)
        ]
    }
}
