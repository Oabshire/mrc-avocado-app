//
//  MenuListView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

/// List of menu items divided into section
struct MenuListView: View {

	/// Order to which menu items are added
	@EnvironmentObject var order: Order

	/// Menu
	var dataSource: MenuModel

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
			}.listStyle(InsetGroupedListStyle())
				.navigationBarTitle("Menu")
		}.navigationViewStyle(StackNavigationViewStyle())
	}
}
struct MenuListView_Previews: PreviewProvider {
	static var previews: some View {
		MenuListView(dataSource: menuDataSource)
	}
}
