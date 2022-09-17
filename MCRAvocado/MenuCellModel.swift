//
//  MenuCellModel.swift
//  MCRAvocado
//
//  Created by Onie on 10.09.2022.
//

import UIKit

struct MenuCellModel {
	let labelText: String
	let description: String?
	let calories: Int
	let cellImageView: UIImage? = UIImage(named: "pancake")
	let price: String

	init(menuItem: MenuItem) {
		labelText = menuItem.name
		description = menuItem.description
		calories = menuItem.calories
		price = "$ " + String(menuItem.price)
	}
}
