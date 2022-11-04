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

	/// Built menu item to add to the order (Product)
	/// - Parameter menuItem: menu item that user picked
	/// - Returns: customized menu item
	func buildMenuItem(from menuItem: MenuItemContainer) -> MenuItemContainer {
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

// MARK: - Private
private extension MenuItemToAddBuilder {

	func buildHotDrink(from menuItem: MenuItemContainer) -> MenuItemContainer {
		let name: String = cupSize.rawValue + " " + menuItem.name + " with " + milkType.rawValue.lowercased()

		return MenuItemContainer(id: menuItem.id,
														 name: name,
														 price: price,
														 isInStock: menuItem.isInStock,
														 calories: menuItem.calories,
														 description: menuItem.description,
														 type: menuItem.type,
														 imageUrl: menuItem.imageUrl,
														 withIce: nil,
														 typeOfMilk: milkType,
														 cupSize: cupSize )
	}

	func buildColdDrink(from menuItem: MenuItemContainer) -> MenuItemContainer {
		var name: String = cupSize.rawValue + " " + menuItem.name
		if iced {
			name += " with ice"
		}

		return MenuItemContainer(id: menuItem.id,
														 name: name,
														 price: price,
														 isInStock: menuItem.isInStock,
														 calories: menuItem.calories,
														 description: menuItem.description,
														 type: menuItem.type,
														 imageUrl: menuItem.imageUrl,
														 withIce: iced,
														 typeOfMilk: nil,
														 cupSize: cupSize)
	}

	func buildDefaultMenuItem(from menuItem: MenuItemContainer) -> MenuItemContainer {
		return MenuItemContainer(id: menuItem.id,
														 name: menuItem.name,
														 price: menuItem.price,
														 isInStock: menuItem.isInStock,
														 calories: menuItem.calories,
														 description: menuItem.description,
														 type: menuItem.type,
														 imageUrl: menuItem.imageUrl,
														 withIce: nil,
														 typeOfMilk: nil,
														 cupSize: nil)
	}
}
