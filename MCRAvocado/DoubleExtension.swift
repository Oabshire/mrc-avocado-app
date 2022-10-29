//
//  DoubleExtension.swift
//  MCRAvocado
//
//  Created by Onie on 04.09.2022.
//

import Foundation

extension Double {
	var roundTwoAfterPoint: String? {
		let currencyFormatter = NumberFormatter()
		currencyFormatter.usesGroupingSeparator = true
		currencyFormatter.numberStyle = .currency
		currencyFormatter.locale = Locale.current
		return currencyFormatter.string(from: NSNumber(value: self))
	}
}
