//
//  OrderAdapter.swift
//  MCRAvocado
//
//  Created by Onie on 29.10.2022.
//

import Foundation

struct OrderAdapter {

	/// Take object of Order type and transom it to OrderContainer type
	/// - Parameter order: object of Order type
	/// - Returns: object of OrderContainer type
	static func adaptToPost(from order: Order) -> OrderContainer {
		var orderedItemContainer: [OrderedItemContainer] = []
		for item in order.orderedItems {
			orderedItemContainer.append(OrderedItemContainer(item: item.key, amount: item.value))
		}
		return OrderContainer(id: UUID(),
													orderedItems: orderedItemContainer,
													totalAmount: order.discountedAmount,
													dateOfCreation: nil,
													estimatedCompletionTime: nil,
													status: nil)
	}
}
