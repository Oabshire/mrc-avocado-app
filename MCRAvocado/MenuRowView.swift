//
//  MenuRowView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

struct MenuRowView: View {
	var menuItem: MenuItem
	var body: some View {
		HStack (alignment: .top) {
			Image(menuItem.imageName)
				.resizable()
				.frame(width: 60, height: 60)
				.cornerRadius(15)
			VStack(alignment: .leading,spacing: 10) {
				HStack(alignment: .top) {
					Text(menuItem.name)
						.font(.title2)
					Spacer()
					VStack(alignment:.trailing) {
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
			Color(red: 0.55, green: 0.45, blue: 0.75)
			MenuRowView(menuItem: MenuItem(name: "Pumpkin spice pancakes",
																		 price: 11.99,
																		 isInStock: true,
																		 calories: 610,
																		 description: TextLibrary.MenuItemDescription.pumpkinPancake, type: .pancakes,
																		 imageName: "pumpkin_spice_pancakes"))
			
		}
		.edgesIgnoringSafeArea(.all)
	}
}
