//
//  SectionOrderModel.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import Foundation

/// Section with Orders groubt by Month and Year
struct SectionalOrderModel {
	/// Orders
	let orders: [OrderContainer]
	///  Name of section
	let sectionName: String
	/// Date of first order in section
	var dateOfFirstOrder: Date {
		orders.first?.dateOfCreation ?? Date()
	}
}
