//
//  OrderContainer.swift
//  MCRAvocado
//
//  Created by Onie on 29.10.2022.
//

import Foundation

struct OrderContainer: Codable {
	let orderedItems: [OrderedItemContainer]
	let totalAmount: Double
	let dateOfCreation: Date?
}

/// Container of  menu items
struct OrderedItemContainer: Codable {
	let item: MenuItemContainer
	let amount: Int
}
