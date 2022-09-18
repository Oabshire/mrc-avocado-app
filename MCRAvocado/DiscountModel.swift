//
//  DiscountModel.swift
//  MCRAvocado
//
//  Created by Onie on 04.09.2022.
//


enum Discount: String {
	case newYear = "New Year's Day"
	case martinLutherKing = "Martin Luther King B-day"
	case washingtons = "Washington’s B-day"
	case nationalIndependenceDay = "Independence Day"
	case halloween = "Halloween"
	case laborDay = "Labor Day"
	case columbusDay = "Columbus Day"
	case veteransDay = "Veterans Day"
	case thanksgivingDay = "Thanksgiving Day"
	case christmasDay = "X-mas"
	case none
	
	var percentageValue: Int {
		switch self {
		case .newYear:
			return 25
		case .thanksgivingDay, .nationalIndependenceDay, .christmasDay:
			return 20
		case .veteransDay, .halloween:
			return 15
		case .martinLutherKing, .washingtons, .laborDay, .columbusDay:
			return 5
		case .none:
			return 0
		}
	}
}

extension Discount: Hashable, Identifiable {
	var id: some Hashable { self }
}
