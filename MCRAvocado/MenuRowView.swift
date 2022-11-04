//
//  MenuRowView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

/// View of row for Menu List
struct MenuRowView: View {

	/// Item with information to display
	let menuItem: MenuItemContainer

	var body: some View {
		HStack(alignment: .top) {
			MenuImage(url: menuItem.imageUrl)
			VStack(alignment: .leading, spacing: 10) {
				HStack(alignment: .top) {
					Text(menuItem.name)
						.font(.title2)
					Spacer()
					VStack(alignment: .trailing) {
						Text("$ " + String(menuItem.price))
						Text("Kcal " + String(menuItem.calories))
					}
				}
				Text(menuItem.description ?? "")
					.frame(alignment: .leading)
					.padding(.bottom, 10)
			}
		}
	}
}
// MARK: - Preview
struct MenuRowView_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color(.lightGray)
			MenuRowView(menuItem:	MenuItemContainer(id: UUID(),
																							name: "Blueberry pancakes",
																							price: 11.99,
																							isInStock: true,
																							calories: 610,
																							description: "Some description",
																							type: .hotDrinks,
																							imageUrl: nil,
																							withIce: nil,
																							typeOfMilk: nil,
																							cupSize: nil))
		}
		.edgesIgnoringSafeArea(.all)
	}
}
