//
//  CartRowView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// Row for ordered items
struct CartRowView: View {
	/// Order with added items or empty
	@EnvironmentObject var order: Order

	/// Ordered menu item
	let menuItem: MenuItemContainer

	var amount: Int
	@State var amountState: Int = 0

	// MARK: - Body
	var body: some View {
		HStack(alignment: .top) {
			MenuImage(url:menuItem.imageUrl)
			VStack(alignment: .leading) {
				Text(menuItem.name)
					.font(.title2)
				HStack {
					Text("$ " + String(menuItem.price) + " × " + String(amountState))
						.frame(minWidth: 100, alignment: .leading)
					Stepper("", value: $amountState, in: 1...99, step: 1).labelsHidden()
				}
			}
		}.onAppear {
			amountState = amount
		}
		.onChange(of: amountState) { _ in
			order.changeAmount(of: menuItem, amount: amountState)
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
	}
}
