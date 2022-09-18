//
//  MenuModel.swift
//  MCRAvocado
//
//  Created by Onie on 10.09.2022.
//

struct MenuModel {
	let section: [Section]
}

struct Section {
	let name: MenuItemType
	let menuItems: [MenuItem]
}

// MARK: - Hashable, Identifiable
extension Section: Hashable, Identifiable {
	var id: some Hashable { name }
}
