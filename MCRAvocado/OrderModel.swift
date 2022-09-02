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
	/// - Returns: True - if item added, false - if not.
	mutating func addMenuItem(item: MenuItem, amount: Int) -> Bool{
		guard item.isInStock else {
			print("Sorry! Out of Stock :(")
			return false
		}
		let existingAmount: Int = orderedItems[item] ?? 0
		orderedItems[item] = existingAmount + amount
		return true
	}
	
	
	/// Full print ordered items with amount
	func printOrderedItems() {
		orderedItems.forEach { print("\(createStringForPrint(from: ($0))): \($1)") }
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
