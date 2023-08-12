//
//  String+.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

extension String {
    func formattedAsCurrency() -> String? {
        if let intValue = Int(self) {
            if let stringValue = intValue.formattedAsCurrency() {
                return stringValue + "원"
            }
        }
        return nil
    }
}
