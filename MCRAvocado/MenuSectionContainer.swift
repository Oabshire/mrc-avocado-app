//
//  MenuSectionContainer.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

import Foundation

/// Container of all menu
struct MenuSectionContainer: Codable {
	let name: String
	let menuItems: [MenuItemContainer]
}

/// Container of  menu items
struct MenuItemContainer: Codable {
	let id: UUID
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let description: String?
	let type: MenuItemType
	let imageUrl: URL?

	enum CodingKeys: String, CodingKey {
		case id = "menuId"
		case name
		case price
		case isInStock
		case calories
		case description
		case type
		case imageUrl
	}
}
