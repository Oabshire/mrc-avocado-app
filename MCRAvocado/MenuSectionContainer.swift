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
	let withIce: Bool?
	let typeOfMilk: MilkType?
	let cupSize: CupSize?

	enum CodingKeys: String, CodingKey {
		case id = "menuId"
		case name
		case price
		case isInStock
		case calories
		case description
		case type
		case imageUrl
		case withIce
		case typeOfMilk
		case cupSize
	}
}

// MARK: - Hashable, Identifiable
extension MenuItemContainer: Hashable, Identifiable {}

// MARK: - Comparable
extension MenuItemContainer: Comparable {
	static func < (lhs: MenuItemContainer, rhs: MenuItemContainer) -> Bool {
		lhs.id.description < rhs.id.description
	}
}

/// Category of menu items
enum MenuItemType: String, Codable {
	case scrambles = "scrambles"
	case omelletes = "omelettes"
	case eggsBenedict = "eggs benedict"
	case oatmeal = "oatmeal"
	case pancakes = "pancakes"
	case waffles = "waffles"
	case bagel = "bagels"
	case dessert = "desserts"
	case side = "sides"
	case coldDrinks = "cold drinks"
	case hotDrinks = "hot drinks"
	case other

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let rawString = try container.decode(String.self)

		if let userType = MenuItemType(rawValue: rawString.lowercased()) {
			self = userType
		} else {
			throw DecodingError.dataCorruptedError(in: container,
																						 debugDescription: "Cannot initialize UserType from invalid String value \(rawString)")
		}
	}
}

/// Type of milk used for coffee, tea, and hot chocolate
enum MilkType: String, Codable {
	case whole = "Whole milk"
	case nonFat = "NonFat milk"
	case soy = "Soy milk"
	case almond = "Almond milk"
	case coconut = "Coconut milk"
	case oatMilk = "Oatmilk"
	case heavyCream =  "Heavy cream"
}

extension MilkType: Hashable, Identifiable {
	var id: some Hashable { self }
}

/// Cup size for beverages
enum CupSize: String, Codable {
	case tall = "Tall"
	case grande = "Grande"
	case venti = "Venti"
}

extension CupSize: Hashable, Identifiable {
	var id: some Hashable { self }
}
