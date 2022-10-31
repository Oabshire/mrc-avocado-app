//
//  OrderContainer.swift
//  MCRAvocado
//
//  Created by Onie on 29.10.2022.
//

import Foundation

/// Container of  menu items
struct OrderedItemContainer: Codable {
	let item: MenuItemContainer
	let amount: Int
}

struct OrderContainer: Codable {
	let id: UUID
	let orderedItems: [OrderedItemContainer]
	let totalAmount: Double
	let dateOfCreation: Date?
	let estimatedCompletionTime: Date?
	let status: OrderStatus?

	enum CodingKeys: String, CodingKey {
		case id = "orderId"
		case orderedItems
		case totalAmount
		case dateOfCreation
		case estimatedCompletionTime
		case status
	}

}
/// Category of menu items
enum OrderStatus: String, Codable {
	case completed = "completed"
	case inProgress = "in progress"

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let rawString = try container.decode(String.self)

		if let userType = OrderStatus(rawValue: rawString.lowercased()) {
			self = userType
		} else {
			throw DecodingError.dataCorruptedError(in: container,
																						 debugDescription: "Cannot initialize UserType from invalid String value \(rawString)")
		}
	}
}
