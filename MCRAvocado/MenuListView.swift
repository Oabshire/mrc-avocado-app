//
//  MenuListView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

struct MenuListView: View {
	var dataSource: MenuModel = menuDataSource

	var body: some View {
		NavigationView {

			let allItems = dataSource.section.flatMap {
				$0.menuItems
			}
			List(allItems) { item in
				NavigationLink(
					destination: MenuDetailView(menuItem: item)) {
						MenuCellView(menuItem: item)
					}
			}
			.navigationBarTitle("Menu")
		}
	}
}


struct MenuListView_Previews: PreviewProvider {
	static var previews: some View {
		MenuListView()
	}
}
