//
//  MenuListView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI
import Foundation

/// List of menu items divided into section
struct MenuListView: View {

	/// Order to which menu items are added
	@EnvironmentObject var order: Order

	/// Menu
	let dataSource: [MenuContainer]

	init(dataSource: [MenuContainer]) {
		self.dataSource = dataSource
		UITableView.appearance().backgroundColor = UIColor.mainBackgroundColor
	}

	var body: some View {
		NavigationView {
			List {
				ForEach(dataSource, id: \.name) { section in
					Section(
						header: Text(section.name)
					) {
						ForEach(section.menuItems ,id: \.name) { item in
							if item.isInStock == true {
								NavigationLink(
									destination: MenuDetailView(order: _order, menuItem: item)) {
										MenuRowView(menuItem: item).padding(.top)
									}
							}
						}
					}
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationBarTitle("Menu")
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct MenuListView_Previews: PreviewProvider {
	static var previews: some View {
		// swiftlint:disable: line_length
		let menuItem = MenuItemContainer(menuId: UUID(),
																		 name: "Blueberry pancakes",
																		 price: 11.99,
																		 isInStock: true,
																		 calories: 610,
																		 description: TextLibrary.MenuItemDescription.blueberryPancake,
																		 type: .hotDrinks,
																		 imageUrl: "https://res.cloudinary.com/jobizil/image/upload/v1602768183/images/menus/xnurgo60mme1ewupfbin.jpg")
		let menuSource = [MenuContainer(name: "hot drinks", menuItems: [menuItem])]
		MenuListView(dataSource: menuSource)
			.environmentObject(orderDataSource)
		MenuListView(dataSource: menuSource)
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		MenuListView(dataSource: menuSource)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		MenuListView(dataSource: menuSource)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
