//
//  DiscountModel.swift
//  MCRAvocado
//
//  Created by Onie on 04.09.2022.
//

import Foundation

/// types of discounts
enum Discount: String, CaseIterable {
	case newYear = "New Year's Day"
	case nationalIndependenceDay = "Independence Day"
	case halloween = "Halloween"
	case veteransDay = "Veterans Day"
	case thanksgivingDay = "Thanksgiving Day"
	case christmasDay = "X-mas"
	case martinLKDay = "Martin L K B-day"
	case valentineDay = "Valentine Day"
	case stPatrickDay = "St Patrick Day"
	case mothersDay = "Mothers Day"
	case fathersDay =  "Fathers Day"
	case washingtons = "Washingtons B-day"
	case laborDay = "Labour Day"
	case everyDay = "Every Day"
	case none = "None"

	/// Get all Discounts exept "none"
	static var getAllDiscounts:[Discount] {
		var result: [Discount] = []
		for discount in self.allCases where discount != .none {
			result.append(discount)
		}
		return result
	}

	/// Persentage value of discounts
	var percentageValue: Int {
		switch self {
		case .newYear:
			return 25
		case .thanksgivingDay, .nationalIndependenceDay, .christmasDay, .mothersDay, .fathersDay:
			return 20
		case .veteransDay, .halloween, .valentineDay, .stPatrickDay:
			return 15
		case .martinLKDay, .washingtons, .laborDay:
			return 5
		case .everyDay:
			return 3
		case .none:
			return 0
		}
	}

	/// Date when Discount available
	/// - Parameter year: year
	/// - Returns: date when Discount available
	func dateOfDiscount(for year: Int) -> Date? {
		switch self {
		case .newYear:
			return Date.newYearDay(year: year)
		case .nationalIndependenceDay:
			return Date.independenceDay(year: year)
		case .halloween:
			return Date.halloweenDay(year: year)
		case .veteransDay:
			return Date.veteransDay(year: year)
		case .thanksgivingDay:
			return Date.thanksGivingDay(year: year)
		case .christmasDay:
			return Date.christmasDay(year: year)
		case .martinLKDay:
			return Date.martinLKDay(year: year)
		case .valentineDay:
			return Date.valentineDay(year: year)
		case .stPatrickDay:
			return Date.stPatrickDay(year: year)
		case .mothersDay:
			return Date.mothersDay(year: year)
		case .fathersDay:
			return Date.fathersDay(year: year)
		case .washingtons:
			return Date.washingtonBDay(year: year)
		case .laborDay:
			return Date.laborDay(year: year)
		case .everyDay:
			return Date()
		case .none:
			return nil
		}
	}

	/// Get available discounts for date
	/// - Parameter date: date
	/// - Returns: array of available discounts
	static func getAvailableDiscounts(for date: Date) -> [Discount] {
		var result: [Discount] = [.none]
		let currentDate = date
		let currentYear: Int = Int(currentDate.get(.year))
		for discount in Self.allCases {
			let discountsDate = discount.dateOfDiscount(for: currentYear)
			if discountsDate?.get(.day) == currentDate.get(.day),
				 discountsDate?.get(.month) == currentDate.get(.month) {
				result.append(discount)
			}
		}
		return result
	}
}

// MARK: - Hashable, Identifiable
extension Discount: Hashable, Identifiable {
	var id: some Hashable { self }
}
