//
//  MenuItemDetailView.swift
//  UIKitAssignment
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// View for detail information about Menu Item
struct MenuItemDetailView: View {
	/// Order to which menu items are added
	@EnvironmentObject var order: Order
	/// verticalSizeClass to define orientation
	@Environment(\.verticalSizeClass ) var verticalSizeClass
	/// verticalSizeClass to define orientation
	@Environment(\.horizontalSizeClass ) var horizontalSizeClass
	/// Source of data
	let menuItem: MenuItemContainer

	var body: some View {
		GeometryReader { geometry in
			let isPortrait = (verticalSizeClass == .regular && horizontalSizeClass == .compact)
			if isPortrait {
				ZStack {
					Color.white
						.edgesIgnoringSafeArea(.all)
					VStack {
						ZStack {
							DetailImageView(menuItemPicture: menuItem.imageUrl)
							LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
														 startPoint: .top,
														 endPoint: .bottom)
							.edgesIgnoringSafeArea(.top)
							.frame(height: 200)
						}
						.frame(height: geometry.size.height/4)
						MenuItemSettingsView(order: _order, menuItem: menuItem)
					}
				}
			} else {
				ZStack {
					Color.white
						.edgesIgnoringSafeArea(.all)
					HStack {
						ZStack(alignment: .top) {
							DetailImageView(menuItemPicture:menuItem.imageUrl)
							LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
														 startPoint: .top,
														 endPoint: .bottom)
							.frame(height: 200)
							.edgesIgnoringSafeArea(.all)
						}
						.frame(width: geometry.size.width/3,
									 height: geometry.size.height)
						MenuItemSettingsView(order: _order, menuItem: menuItem)
					}
				}
			}
		}
	}
}

// MARK: - Preview
struct MenuDetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			let menuItem = MenuItemContainer(id: UUID(),
																			 name: "Blueberry pancakes",
																			 price: 11.99,
																			 isInStock: true,
																			 calories: 610,
																			 description: "Some description",
																			 type: .hotDrinks,
																			 imageUrl: nil,
																			 withIce: nil,
																			 typeOfMilk: nil,
																			 cupSize: nil)
			MenuItemDetailView(menuItem: menuItem)
		}
	}
}
