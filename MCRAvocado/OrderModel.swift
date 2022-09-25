//
//  OrderModel.swift
//  MCRAvocado
//
//  Created by Onie on 28.08.2022.
//

import Foundation

/// Order Model
class Order: ObservableObject {
	
	// MARK: - Properties
	@Published var orderedItems: [MenuItem: Int] = [:]
	let numberOfPersons: Int = 1
	var discount: Discount = .none
	let tableNumber: Int = 1
	let dateOfCreation: Date = Date()
	
	var amountWithoutDiscount: Double {
		var totalPrice = 0.0
		for a in orderedItems {
			totalPrice += (a.key.price * Double(a.value))
		}
		return totalPrice
	}
	
	var discountedAmount: Double {
		let amountAfterDiscount = amountWithoutDiscount - amountWithoutDiscount * Double(discount.percentageValue) / 100.0
		return  amountAfterDiscount.roundTwoAfterPoint
	}
	
	/// Init
	/// - Parameters:
	///   - orderedItems: ordered menu items and it amount
	init(orderedItems: [MenuItem: Int]) {
		self.orderedItems = orderedItems	}
	
	// MARK: - Functions
	
	/// Add menu item to existing order
	/// - Parameters:
	///   - item: menu item to add
	///   - amount: amount of items
	/// - Returns: True - if item added, false - if not.
	func addMenuItem(item: MenuItem, amount: Int) -> Bool{
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
	func printOrderedItemsNameAndAmount() {
		print("---- Order ----")
		for (item, amount) in orderedItems {
			print("\(item.name) : \(amount)")
		}
	}
}

// MARK: - Private

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
			result += ", Cup Size: \(cupSize)"
		}
		result += ", Type: \(menuItem.type)"
		
		return result
	}
}
