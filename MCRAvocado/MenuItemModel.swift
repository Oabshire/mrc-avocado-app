//
//  MenuItemModel.swift
//  MCRAvocado
//
//  Created by Onie on 28.08.2022.
//

import Foundation

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
enum MilkType: String {
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
enum CupSize: String {
	case tall = "Tall"
	case grande = "Grande"
	case venti = "Venti"
}

extension CupSize: Hashable, Identifiable {
	var id: some Hashable { self }
}

/// Menu Item Model
struct MenuItem {
	let id = UUID()
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let description: String?
	let type: MenuItemType
	let withIce: Bool?
	let typeOfMilk: MilkType?
	let cupSize: CupSize?
	let imageUrl: URL?

	/// Init
	/// - Parameters:
	///   - name: Name of the item
	///   - price: price of the item
	///   - isInStock: is item in stock
	///   - calories: calories in 1 portion
	///   - description: description of item used in menu
	///   - type: type of item
	///   - withIce: is item with ice if it is a beverage
	///   - typeOfMilk: type of milk if item is a beverage
	///   - cupSize: size of cup if it item is a beverage
	///   - imageName: name of image for menu or order
	init(name: String,
			 price: Double,
			 isInStock: Bool,
			 calories: Int,
			 description: String? = nil,
			 type: MenuItemType,
			 withIce: Bool? = nil,
			 typeOfMilk: MilkType? = nil,
			 cupSize: CupSize? = nil,
			 imageUrl: URL? = nil) {
		self.name = name
		self.price = price
		self.isInStock = isInStock
		self.calories = calories
		self.description = description
		self.type = type
		self.withIce = withIce
		self.typeOfMilk = typeOfMilk
		self.cupSize = cupSize
		self.imageUrl = imageUrl
	}
}

// MARK: - Hashable, Identifiable
extension MenuItem: Hashable, Identifiable {}

// MARK: - Comparable
extension MenuItem: Comparable {
	static func < (lhs: MenuItem, rhs: MenuItem) -> Bool {
		lhs.id.description < rhs.id.description
	}
}
