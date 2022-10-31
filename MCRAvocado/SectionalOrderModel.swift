//
//  SectionOrderModel.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import Foundation

struct SectionalOrderModel {
	let orders: [OrderContainer]
	let monthYearString: String
	var first: Date {
		orders.first?.dateOfCreation ?? Date()
	}
}
