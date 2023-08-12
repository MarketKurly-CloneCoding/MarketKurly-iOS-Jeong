//
//  Int+.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/08/12.
//

import UIKit

extension Int {
    func formattedAsCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self))
    }
}
