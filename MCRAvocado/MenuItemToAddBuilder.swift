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
	func buildMenuItem(from menuItem: MenuItemContainer) -> MenuItem {
		switch menuItem.type {
		case .coldDrinks:
			return buildColdDrink(from: menuItem)
		case .hotDrinks:
			return buildHotDrink(from: menuItem)
		default:
			return buildDefaultMenuItem(from: menuItem)
		}
	}
}

private extension MenuItemToAddBuilder {

	func buildHotDrink(from menuItem: MenuItemContainer) -> MenuItem {
		let name: String = cupSize.rawValue + " " + menuItem.name + " with " + milkType.rawValue.lowercased()

		return MenuItem(id: menuItem.id,
										name: name,
										price: price,
										isInStock: menuItem.isInStock,
										calories: menuItem.calories,
										description: menuItem.description,
										type: menuItem.type,
										withIce: nil,
										typeOfMilk: milkType,
										cupSize: cupSize,
										imageUrl: menuItem.imageUrl )
	}

	func buildColdDrink(from menuItem: MenuItemContainer) -> MenuItem {
		var name: String = cupSize.rawValue + " " + menuItem.name
		if iced {
			name += " with ice"
		}

		return MenuItem(id: menuItem.id,
										name: name,
										price: price,
										isInStock: menuItem.isInStock,
										calories: menuItem.calories,
										description: menuItem.description,
										type: menuItem.type,
										withIce: iced,
										typeOfMilk: nil,
										cupSize: cupSize,
										imageUrl: menuItem.imageUrl)
	}

	func buildDefaultMenuItem(from menuItem: MenuItemContainer) -> MenuItem {
		return MenuItem(id: menuItem.id,
										name: menuItem.name,
										price: menuItem.price,
										isInStock: menuItem.isInStock,
										calories: menuItem.calories,
										description: menuItem.description,
										type: menuItem.type,
										imageUrl: menuItem.imageUrl)
	}
}
