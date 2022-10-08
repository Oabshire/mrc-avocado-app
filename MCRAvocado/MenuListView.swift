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
	let dataSource: MenuModel

	init(dataSource: MenuModel) {
		self.dataSource = dataSource
		UITableView.appearance().backgroundColor = UIColor.mainBackgroundColor
	}

	var body: some View {
		NavigationView {
			List {
				ForEach(dataSource.section, id: \.hashValue) { section in
					Section(
						header: Text(section.name.rawValue)
					) {
						ForEach(section.menuItems) { item in
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
		}.navigationViewStyle(StackNavigationViewStyle())
	}
}
struct MenuListView_Previews: PreviewProvider {
	static var previews: some View {
		MenuListView(dataSource: menuDataSource)
			.environmentObject(orderDataSource)
		MenuListView(dataSource: menuDataSource)
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		MenuListView(dataSource: menuDataSource)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		MenuListView(dataSource: menuDataSource)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
