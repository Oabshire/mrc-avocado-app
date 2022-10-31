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
	@Published private(set) var orderedItems: [MenuItemContainer: Int] = [:]
	var discount: Discount = .none

	var amountWithoutDiscount: Double {
		var totalPrice = 0.0
		for item in orderedItems {
			totalPrice += (item.key.price * Double(item.value))
		}
		return totalPrice
	}

	var discountedAmount: Double {
		let amountAfterDiscount = amountWithoutDiscount - amountWithoutDiscount * Double(discount.percentageValue) / 100.0
		return  amountAfterDiscount
	}

	/// Init
	/// - Parameters:
	///   - orderedItems: ordered menu items and it amount
	init(orderedItems: [MenuItemContainer: Int]) {
		self.orderedItems = orderedItems
	}

	// MARK: - Functions

	/// Add menu item to existing order
	/// - Parameters:
	///   - item: menu item to add
	///   - amount: amount of items
	/// - Returns: True - if item added, false - if not.
	func addMenuItem(item: MenuItemContainer, amount: Int) -> Bool {
		guard item.isInStock else {
			print("Sorry! Out of Stock :(")
			return false
		}
		let existingAmount: Int = orderedItems[item] ?? 0
		orderedItems[item] = existingAmount + amount
		return true
	}

	func removeItem(at offsets: IndexSet) {
		if let indx = offsets.first {
			let item = orderedItems.sorted(by: <)[indx]
			orderedItems.removeValue(forKey: item.key)
		}
	}

	func clearOrder() {
		orderedItems = [:]
		discount = .none
	}
}
