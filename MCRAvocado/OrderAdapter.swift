//
//  OrderAdapter.swift
//  MCRAvocado
//
//  Created by Onie on 29.10.2022.
//

struct OrderAdapter {
	static func adaptToPost(from order: Order) -> OrderContainer {
		var orderedItemContainer: [OrderedItemContainer] = []
		for item in order.orderedItems {
			orderedItemContainer.append(OrderedItemContainer(item: item.key, amount: item.value))
		}
		return OrderContainer(orderedItems: orderedItemContainer,
													totalAmount: order.discountedAmount,
													dateOfCreation: nil)
	}
}
