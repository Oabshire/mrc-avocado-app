//
//  OrderModel.swift
//  MCRAvocado
//
//  Created by Onie on 28.08.2022.
//

import Foundation

/// Order Model
struct Order {
	var orderedItems: [MenuItem: Int]
	let numberOfPersons: Int
	let tableNumber: Int
	let dateOfCreation: Date
	
	var totalPrice: Double {
		var totalPrice = 0.0
		for a in orderedItems {
			totalPrice += a.key.price
		}
		return totalPrice
	}
	
	
	/// Add menu item to existing order
	/// - Parameters:
	///   - item: menu item to add
	///   - amount: ammount of items
	func addMenuItem(item: MenuItem, amount: Int, to order: inout Order) {
		guard item.isInStock else {
			print("Sorry! Out of Stock :(")
			return
		}
		let existingAmount: Int = order.orderedItems[item] ?? 0
		order.orderedItems[item] = existingAmount + amount
	}
	
	
	/// Full print ordered items with amount
	func printOrderedItems() {
		for (item, amount) in orderedItems {
			print("\(createStringForPrint(from: item)) : \(amount)")
		}
	}
	
	/// Print Name and amount of ordered items
	func printOrderedItemsNameAngAmount() {
		for (item, amount) in orderedItems {
			print("\(item.name) : \(amount)")
		}
	}
}

private extension Order {
	func createStringForPrint(from menuItem: MenuItem) -> String {
		var result = "Name: \(menuItem.name), Price: \(menuItem.price), Is in stock: \(menuItem.isInStock), Calories: \(menuItem.calories), Type: \(menuItem.type)"
		if let description = menuItem.description {
			result += ", Description: \(description)"
		}
		if let typeOfMilk = menuItem.typeOfMilk {
			result += ", Type of milk: \(typeOfMilk)"
		}
		if let withIce = menuItem.withIce {
			result += ", With ice: \(withIce)"
		}
		if let cupSize = menuItem.cupSize {
			result += ", Cup Sise: \(cupSize)"
		}
		result += ", Type: \(menuItem.type)"
		
		return result
	}
}
