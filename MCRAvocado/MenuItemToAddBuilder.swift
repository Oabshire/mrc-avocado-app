//
//  MenuItemToAddBuilder.swift
//  MCRAvocado
//
//  Created by Onie on 25.09.2022.
//

/// Builder
class MenuItemToAddBuilder {

	public var price: Double = 0
	public var milkType: MilkType = .whole
	public var cupSize: CupSize = .grande
	public var iced: Bool = false

	/// Built menu idem to add to the order (Product)
	/// - Parameter menuItem: menu item that user picked
	/// - Returns: customized menu item
	func buildMenuItem(from menuItem: MenuItem) -> MenuItem {
		switch menuItem.type {
		case .coldDrinks:
			return buildColdDrink(from: menuItem)
		case .hotDrinks:
			return buildHotDrink(from: menuItem)
		default:
			return menuItem
		}
	}
}

private extension MenuItemToAddBuilder {

	func buildHotDrink(from menuItem: MenuItem) -> MenuItem {
		let name: String = cupSize.rawValue + " " + menuItem.name + " with " + milkType.rawValue.lowercased()

		return MenuItem(name: name,
										price: price,
										isInStock: menuItem.isInStock,
										calories: menuItem.calories,
										description: menuItem.description,
										type: menuItem.type,
										withIce: nil,
										typeOfMilk: milkType,
										cupSize: cupSize,
										imageName: menuItem.imageName)
	}

	func buildColdDrink(from menuItem: MenuItem) -> MenuItem {
		var name: String = cupSize.rawValue + " " + menuItem.name
		if iced {
			name += " with ice"
		}

		return MenuItem(name: name,
										price: price,
										isInStock: menuItem.isInStock,
										calories: menuItem.calories,
										description: menuItem.description,
										type: menuItem.type,
										withIce: iced,
										typeOfMilk: nil,
										cupSize: cupSize,
										imageName: menuItem.imageName)
	}
}
