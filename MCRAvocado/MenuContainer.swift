//
//  MenuContainer.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

import Foundation

/// Container of all menu
struct MenuContainer: Decodable {
	let name: String
	let menuItems: [MenuItemContainer]
}

/// Container of  menu items
struct MenuItemContainer: Decodable {
	let menuId: UUID
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let description: String?
	let type: MenuItemType
	let imageUrl: String
}
