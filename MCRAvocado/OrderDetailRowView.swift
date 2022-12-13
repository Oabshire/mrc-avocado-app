//
//  OrderDetailRowView.swift
//  MCRAvocado
//
//  Created by Onie on 07.12.2022.
//

import SwiftUI

/// Row for ordered items
struct OrderDetailRowView: View {
	let isOrderCompleted: Bool
	@State var isReviewShown = false
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
			if isOrderCompleted {
				Spacer()
				Button {
					isReviewShown.toggle()
				} label: {
					Text("Review")
						.foregroundColor(Color.onboardingAccentColor)
						.fullScreenCover(isPresented: $isReviewShown) {
							ReviewView(isShown: $isReviewShown)
						}
				}
			}
		}
	}
}
// MARK: - Preview
struct OrderDetailRowView_Preview: PreviewProvider {
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
		OrderDetailRowView(isOrderCompleted: true, menuItem: menuItem, amount: 1)
	}
}
