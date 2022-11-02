//
//  SectionOrderModel.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import Foundation

struct SectionalOrderModel {
	let orders: [OrderContainer]
	let sectionName: String
	var dateOfFirstOrder: Date {
		orders.first?.dateOfCreation ?? Date()
	}
}
