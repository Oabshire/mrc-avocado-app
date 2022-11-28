//
//  OrderModel.swift
//  MCRAvocado
//
//  Created by Onie on 28.08.2022.
//

import Foundation

/// Order Model
class Order: ObservableObject, Codable {

	// MARK: - Properties

	/// Orderd items
	@Published private(set) var orderedItems: [MenuItemContainer: Int] = [:]

	/// Discount type
	@Published var discount: Discount = .none

	/// Amount withow discount
	var amountWithoutDiscount: Double {
		var totalPrice = 0.0
		for item in orderedItems {
			totalPrice += (item.key.price * Double(item.value))
		}
		return totalPrice
	}

	/// Amount with discount
	var discountedAmount: Double {
		let amountAfterDiscount = amountWithoutDiscount - amountWithoutDiscount * Double(discount.percentageValue) / 100.0
		return  amountAfterDiscount
	}

	// MARK: - Init
	/// Init
	/// - Parameters:
	///   - orderedItems: ordered menu items and it amount
	init(orderedItems: [MenuItemContainer: Int]) {
		self.orderedItems = orderedItems
	}

	// MARK: - Codable
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		orderedItems = try values.decode([MenuItemContainer: Int].self, forKey: .orderedItems)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(orderedItems, forKey: .orderedItems)
	}

	enum CodingKeys: String, CodingKey {
		case orderedItems
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
		saveJSONOrder()
		return true
	}

	/// Change amount of orderedItems.
	/// - Parameters:
	///   - item: menu item to add
	///   - amount: amount of items
	func changeAmount(of item: MenuItemContainer, amount: Int) {
		guard item.isInStock else {
			print("Sorry! Out of Stock :(")
			return
		}
		if amount == 0 {
			orderedItems.removeValue(forKey: item)
		}
		orderedItems[item] = amount
		saveJSONOrder()
	}

	/// Removes item from orderedItems at first offset.
	/// - Parameter offsets: set of idexes
	func removeItem(at offsets: IndexSet) {
		if let indx = offsets.first {
			let item = orderedItems.sorted(by: <)[indx]
			orderedItems.removeValue(forKey: item.key)
		}
		saveJSONOrder()
	}

	/// Remove all items from orderedItems and set discount no none.
	func clearOrder() {
		orderedItems = [:]
		discount = .none
		saveJSONOrder()
	}
}

// MARK: - Save Order to JSON
extension Order {

	/// URL of orer file
	private var dataJSONURL: URL {
		URL(fileURLWithPath: "Order",
				relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
	}

	/// Gets Order from json
	func loadJSONOrder() {
		guard FileManager.default.fileExists(atPath: dataJSONURL.path) else {
			return
		}
		let decoder = JSONDecoder()

		do {
			let orderData = try Data(contentsOf: dataJSONURL)
			let jsonOrder = try decoder.decode(Order.self, from: orderData)
			orderedItems = jsonOrder.orderedItems
		} catch let error {
			print(error)
		}
	}

	/// Save order to json file
	private func saveJSONOrder() {
		orderedItems = self.orderedItems
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted

		do {
			let orderData = try encoder.encode(self)
			try orderData.write(to: dataJSONURL, options: .atomicWrite)
		} catch let error {
			print(error)
		}
	}
}
