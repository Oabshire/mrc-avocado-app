//
//  StartView.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

/// First view that user sees
struct StartView: View {
	@EnvironmentObject var order: Order
	@AppStorage("FlightStatusCurrentTab") var selectedTab = 1

	let factory: ListFactory
	let menu: MenuModel = menuDataSource
	let discounts: [Discount] = discountDataSource

	init(factory: ListFactory) {
		self.factory = factory
		let opaqueAppearance = UITabBarAppearance()
		opaqueAppearance.configureWithOpaqueBackground()
		UITabBar.appearance().scrollEdgeAppearance = opaqueAppearance
	}

	var body: some View {
		TabView(selection: $selectedTab) {
			// tab with discounts
			factory.createDiscountGrid(discounts: discounts)
				.tabItem {
					Image(systemName: "percent")
						.resizable()
					Text("Discounts")
				}
				.badge(discounts.count) // badge display amount of discount
				.tag(0)

			// tab with menu
			factory.createMenuList(menu: menu, order: order)
				.tabItem {
					Image(systemName: "menucard")
						.resizable()
					Text("Menu")
				}
				.badge(menu.section.flatMap {$0.menuItems}.filter{$0.isInStock}.count) // badge display amount of menu items
				.tag(1)

			// tab with ordered items
			factory.createOrderList(order: order)
				.tabItem {
					Image(systemName: "cart")
						.resizable()
					Text("Order")
				}
				.badge(order.orderedItems.count)  // badge display amount of ordered items
				.tag(2)
		}
	}
}

struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		let listFactory = ListFactory()
		StartView(factory: listFactory)
			.environmentObject(orderDataSource)
		StartView(factory: listFactory)
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		StartView(factory: listFactory)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		StartView(factory: listFactory)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
