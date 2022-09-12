//
//  MenuDetailView.swift
//  UIKitAssignment
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// View for Detail information about menu item
struct MenuDetailView: View {
	@Environment(\.verticalSizeClass ) var verticalSizeClass
	@Environment(\.horizontalSizeClass ) var horizontalSizeClass
	@State var amountToAdd: Int = 1

	/// Action for bottom button
	var donePressed: (() -> Void)?

	/// Source of data
	var menuItem: MenuItem?

	var body: some View {
		let isPortrait = (verticalSizeClass == .regular && horizontalSizeClass == .compact)
		if isPortrait {
			ZStack{
				Color.mainBackgroundColor
					.edgesIgnoringSafeArea(.all)
				VStack {
					Image("pancake")
						.resizable()
						.frame(width: 150, height: 150)
					if let menuItem = menuItem {
						DetailView(amountToAdd: $amountToAdd, menuItem: menuItem, donePressed: donePressed)
					}
				}
			}
		} else {
			ZStack{
				Color.mainImageColor
					.edgesIgnoringSafeArea(.all)
				if let menuItem = menuItem {
					DetailView(amountToAdd: $amountToAdd, menuItem: menuItem, donePressed: donePressed)
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