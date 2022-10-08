//
//  MenuDetailView.swift
//  UIKitAssignment
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// View for Detail information about menu item 
struct MenuDetailView: View {

	/// Order to which menu items are added
	@EnvironmentObject var order: Order
	
	@Environment(\.verticalSizeClass ) var verticalSizeClass
	@Environment(\.horizontalSizeClass ) var horizontalSizeClass

	/// Source of data
	let menuItem: MenuItem

	var body: some View {
		GeometryReader { geometry in
			let isPortrait = (verticalSizeClass == .regular && horizontalSizeClass == .compact)
			if isPortrait {
				ZStack{
					Color.white
						.edgesIgnoringSafeArea(.all)
					VStack {
						ZStack{
							Image(menuItem.imageName)
								.resizable()
								.scaledToFill()
							LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
														 startPoint: .top,
														 endPoint: .bottom)
							.edgesIgnoringSafeArea(.top)
							.frame(height: 200)
						}
						.frame(height: geometry.size.height/4)
						MenuItemDetailView(order: _order,menuItem: menuItem)
					}
				}
			} else {
				ZStack{
					Color.white
						.edgesIgnoringSafeArea(.all)
					HStack {
						ZStack(alignment: .top) {
							Image(menuItem.imageName)
								.resizable()
								.scaledToFill()
							LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
														 startPoint: .top,
														 endPoint: .bottom)
							.frame(height: 200)
						}
						.edgesIgnoringSafeArea(.all)
						.frame(width: geometry.size.width/3,
									 height: geometry.size.height)
						MenuItemDetailView(order: _order,menuItem: menuItem)
					}
				}
			}
		}
	}
}

struct MenuDetailView_Previews: PreviewProvider {

	static var previews: some View {
		let menuItem = MenuItem(name: "Blueberry pancake",
														price: 11.99,
														isInStock: true,
														calories: 610,
														description:"Some long, very lond description, very very long  description",
														type: .pancakes,
														imageName: "blueberry_pancakes")

		MenuDetailView(menuItem: menuItem)
		MenuDetailView(menuItem: menuItem)
			.preferredColorScheme(.dark)
		MenuDetailView(menuItem: menuItem)
			.previewLayout(.fixed(width: 568, height: 320))
		MenuDetailView(menuItem: menuItem)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
