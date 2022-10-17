//
//  MenuRowView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

/// View of row for Menu List
struct MenuRowView: View {
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
			}
		}
	}
}

struct MenuRowView_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color(.green)
			MenuRowView(menuItem:	MenuItemContainer(menuId: UUID(),
																							name: "Blueberry pancakes",
																							price: 11.99,
																							isInStock: true,
																							calories: 610,
																							description: TextLibrary.MenuItemDescription.blueberryPancake,
																							type: .hotDrinks,
																							imageUrl:nil))
		}
		.edgesIgnoringSafeArea(.all)
	}
}
