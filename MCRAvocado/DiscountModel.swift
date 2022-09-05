//
//  DiscountModel.swift
//  MCRAvocado
//
//  Created by Onie on 04.09.2022.
//


enum Discount {
	case newYear
	case martinLutherKing
	case washingtons
	case memorialDay
	case nationalIndependenceDay
	case laborDay
	case columbusDay
	case veteransDay
	case thanksgivingDay
	case christmasDay
	case none
	
	var percentageValue: Int {
		switch self {
		case .newYear:
			return 25
		case .thanksgivingDay, .nationalIndependenceDay, .christmasDay:
			return 20
		case .memorialDay, .veteransDay:
			return 15
		case .martinLutherKing, .washingtons, .laborDay, .columbusDay:
			return 5
		case .none:
			return 0
		}
	}
}
