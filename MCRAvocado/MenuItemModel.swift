//
//  MenuItemModel.swift
//  MCRAvocado
//
//  Created by Onie on 28.08.2022.
//

import Foundation

/// Category of menu items
enum MenuItemType: String {
	case scrambles = "Scrambles"
	case omeletes = "Omelettes"
	case eggsBenedict = "Eggs Benedict"
	case oatmeal = "Oatmeal"
	case pancakes = "Pancakes"
	case waffles = "Waffles"
	case bagel = "Bagels"
	case dessert = "Desserts"
	case side = "Sides"
	case coldDrinks = "Cold drinks"
	case hotDrinks = "Hot drinks"
	case other
}

/// Type of milk used for coffee, tea, and hot chocolate
enum MilkType {
	case whole
	case nonFat
	case soy
	case almond
	case coconut
	case oatMilk
	case heavyCream
}


/// Cup size for beverages
enum CupSize {
	case tall
	case grande
	case venti
}

/// Menu Item Model
struct MenuItem {
	let id = UUID()
	let name: String
	let price: Double
	var isInStock: Bool
	let calories: Int
	let description: String?
	let type: MenuItemType
	let withIce: Bool?
	let typeOfMilk: MilkType?
	let cupSize: CupSize?
	let imageName: String
	
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
			 type: MenuItemType, withIce: Bool? = nil,
			 typeOfMilk: MilkType? = nil,
			 cupSize: CupSize? = nil,
			 imageName: String) {
		self.name = name
		self.price = price
		self.isInStock = isInStock
		self.calories = calories
		self.description = description
		self.type = type
		self.withIce = withIce
		self.typeOfMilk = typeOfMilk
		self.cupSize = cupSize
		self.imageName = imageName
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
