//
//  MenuModel.swift
//  MCRAvocado
//
//  Created by Onie on 10.09.2022.
//

struct MenuModel {
	let section: [DishCategory]
}

struct DishCategory {
	let name: MenuItemType
	let menuItems: [MenuItem]
}

// MARK: - Hashable, Identifiable
extension DishCategory: Hashable, Identifiable {
	var id: some Hashable { name }
}
