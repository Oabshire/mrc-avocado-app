//
//  MetuItemToAddBuilder.swift
//  MCRAvocado
//
//  Created by Onie on 25.09.2022.
//


/// Builder
class MetuItemToAddBuilder {

	public var price: Double = 0
	public var milktype: MilkType = .whole
	public var cupSize: CupSize = .grande
	public var iced: Bool = false


	/// built menu idem to add to the order (Product)
	/// - Parameter menuItem: menu item that user picked
	/// - Returns: customized menu item
	func buildMenuItem(from menuItem: MenuItem) -> MenuItem {
		if menuItem.type == .coldDrinks {
			return buildColdDrink(from: menuItem)
		}
		else if menuItem.type == .hotDrinks {
			return buildHotDrink(from: menuItem)
		}
		return menuItem
	}
}

private extension MetuItemToAddBuilder {

	func buildHotDrink(from menuItem: MenuItem) -> MenuItem {
		let name: String = cupSize.rawValue + " " + menuItem.name + " with " + milktype.rawValue.lowercased()

		return MenuItem(name: name,
										price: price,
										isInStock: menuItem.isInStock,
										calories: menuItem.calories,
										description: menuItem.description,
										type: menuItem.type,
										withIce: nil,
										typeOfMilk: milktype,
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
