//
//  StartView.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

struct StartView: View {
	@EnvironmentObject var order: Order
	@AppStorage("FlightStatusCurrentTab") var selectedTab = 1
	@State var menuIsShowing = true
	var menu = menuDataSource
	var discounts = discountDataSource

	init() {
		let opaqueAppearence = UITabBarAppearance()
		opaqueAppearence.configureWithOpaqueBackground()
		UITabBar.appearance().scrollEdgeAppearance = opaqueAppearence
	}

	var body: some View {
		TabView(selection: $selectedTab) {
			DiscountGridView(discountsDataSource: discounts)
				.tabItem {
					Image(systemName: "percent")
						.resizable()
					Text("Discounts")
				}
				.badge(discounts.count)
				.tag(0)

			MenuListView(order: _order, dataSource: menu)
				.tabItem {
					Image(systemName: "menucard")
						.resizable()
					Text("Menu")
				}
				.badge(menu.section.flatMap {$0.menuItems}.count)
				.tag(1)

			OrderListView(order: _order)
				.tabItem {
					Image(systemName: "cart")
						.resizable()
					Text("Order")
				}
				.badge(order.orderedItems.count)
				.tag(2)
		}
	}
}

struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		StartView()
	}
}
