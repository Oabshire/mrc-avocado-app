//
//  MenuDetailView.swift
//  UIKitAssignment
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// View for Detail information about menu item
struct MenuDetailView: View {
	@EnvironmentObject var order: Order
	@Environment(\.verticalSizeClass ) var verticalSizeClass
	@Environment(\.horizontalSizeClass ) var horizontalSizeClass

	/// Source of data
	var menuItem: MenuItem

	var body: some View {
		GeometryReader { geometry in
			let isPortrait = (verticalSizeClass == .regular && horizontalSizeClass == .compact)
			if isPortrait {
				ZStack{
					Color.mainBackgroundColor
						.edgesIgnoringSafeArea(.all)
					VStack {
						Image(menuItem.imageName)
							.resizable()
							.scaledToFill()
							.edgesIgnoringSafeArea(.all)
							.frame(width: geometry.size.width,
										 height: geometry.size.height/3)

						if let menuItem = menuItem {
							MenuItemDetailView(order: _order,menuItem: menuItem)
						}
					}
				}
			} else {
				ZStack{
					Color.mainBackgroundColor
						.edgesIgnoringSafeArea(.all)
					HStack {
						Image(menuItem.imageName)
							.resizable()
							.scaledToFill()
							.edgesIgnoringSafeArea(.all)
							.frame(width: geometry.size.width/3,
										 height: geometry.size.height)

						if let menuItem = menuItem {
							MenuItemDetailView(order: _order,menuItem: menuItem)
						}
					}
				}
			}
		}
	}
}

struct MenuDetailView_Previews: PreviewProvider {

	static var previews: some View {
		MenuDetailView(menuItem: (menuDataSource.section.first?.menuItems.first)!)
		MenuDetailView(menuItem: (menuDataSource.section.first?.menuItems.first)!).preferredColorScheme(.dark)
		MenuDetailView(menuItem: (menuDataSource.section.first?.menuItems.first)!).previewLayout(.fixed(width: 568, height: 320))
		MenuDetailView(menuItem: (menuDataSource.section.first?.menuItems.first)!).previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
