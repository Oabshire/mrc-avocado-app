//
//  CartRowView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// Row for ordered items
struct CartRowView: View {

	/// Ordered menu item
	let menuItem: MenuItemContainer

	/// Amount of ordered menu items
	let amount: Int

	// MARK: - Body
	var body: some View {
		HStack(alignment: .top) {
			MenuImage(url:menuItem.imageUrl)
			VStack(alignment: .leading) {
				Text(menuItem.name)
					.font(.title2)
				Text("$ " + String(menuItem.price) + " × " + String(amount))
			}
		}
	}
}

// MARK: - Preview
struct CartRowView_Preview: PreviewProvider {
	static var previews: some View {
		let menuItem = MenuItemContainer(id: UUID(),
																		 name: "Blueberry pancake",
																		 price: 11.99,
																		 isInStock: true,
																		 calories: 610,
																		 description: "",
																		 type: .pancakes,
																		 imageUrl: nil,
																		 withIce: nil,
																		 typeOfMilk: nil,
																		 cupSize: nil)
		CartRowView(menuItem: menuItem, amount: 1)
		CartRowView(menuItem: menuItem, amount: 1)
			.preferredColorScheme(.dark)
		CartRowView(menuItem: menuItem, amount: 1)
			.previewLayout(.fixed(width: 568, height: 320))
		CartRowView(menuItem: menuItem, amount: 1)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
