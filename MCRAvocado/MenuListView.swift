//
//  MenuListView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

struct MenuListView: View {
	@EnvironmentObject var order: Order
	var dataSource: MenuModel

	var body: some View {
		NavigationView {
			List {
				ForEach(dataSource.section, id: \.hashValue) { section in

					Section(
						header: Text(section.name.rawValue)
					) {
						ForEach(section.menuItems) { item in
							NavigationLink(
								destination: MenuDetailView(order: _order, menuItem: item)) {
									MenuRowView(menuItem: item)
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
