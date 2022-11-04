//
//  ItemEntityAdapter.swift
//  MCRAvocado
//
//  Created by Onie on 03.11.2022.
//

import SwiftUI

struct ItemEntityAdapter {

	/// Transform entity to MenuItemContainer
	/// - Parameter entity: ItemEntity element
	/// - Returns: object of MenuItemContainer type
	static func createItemContainer (from entity: FetchedResults<ItemEntity>.Element ) -> MenuItemContainer {
		MenuItemContainer(id: entity.id,
											name: entity.name,
											price: entity.price,
											isInStock: entity.isInStock,
											calories: Int(entity.calories),
											description: entity.descript,
											type: MenuItemType(rawValue: entity.type) ?? .other,
											imageUrl: entity.imageUrl,
											withIce: nil,
											typeOfMilk: nil,
											cupSize: nil)
	}
}
