//
//  DoubleExtension.swift
//  MCRAvocado
//
//  Created by Onie on 04.09.2022.
//

import Foundation

extension Double {

	/// Transform Double into  String with 2 decimal places after point
	var toCurrencyString: String? {
		let currencyFormatter = NumberFormatter()
		currencyFormatter.usesGroupingSeparator = true
		currencyFormatter.numberStyle = .currency
		currencyFormatter.locale = Locale(identifier: "en_us")
		return currencyFormatter.string(from: NSNumber(value: self))
	}
}
