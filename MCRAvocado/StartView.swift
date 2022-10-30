//
//  StartView.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI
import CoreData

/// First view that user sees
struct StartView: View {
	@EnvironmentObject var launchScreenManager: LaunchScreenManager
	@EnvironmentObject var order: Order
	@Binding var selectedTab: Int
	@State var isLoading = true
	@State var menu: [MenuSectionContainer] = []

	let factory: OrderListFactory
	let discounts: [Discount] = discountDataSource

	init(factory: OrderListFactory,
			 selectedTab: Binding<Int>) {
		self.factory = factory
		_selectedTab = selectedTab
		let opaqueAppearance = UITabBarAppearance()
		opaqueAppearance.configureWithOpaqueBackground()
		UITabBar.appearance().scrollEdgeAppearance = opaqueAppearance
	}

	var body: some View {
		TabView(selection: $selectedTab) {
			// tab with discounts
			DiscountGridView(discountsDataSource: discounts)
				.tabItem {
					Image(systemName: "percent")
						.resizable()
					Text("Discounts")
				}
			// badge display amount of discount
				.badge(discounts.count)
				.tag(0)

			// tab with menu
			MenuListView(isLoading: $isLoading).environmentObject(order)
				.tabItem {
					Image(systemName: "menucard")
						.resizable()
					Text("Menu")
				}
			// badge display amount of menu items
				.badge(menu.flatMap { $0.menuItems }.filter { $0.isInStock }.count)
				.tag(1)

			// tab with ordered items
			factory.createOrderList(order: order)
				.tabItem {
					Image(systemName: "cart")
						.resizable()
					Text("Cart")
				}
			// badge display amount of ordered items
				.badge(order.orderedItems.count)
				.tag(2)
		}.onChange(of: isLoading) { _ in
			launchScreenManager.dismiss()
		}
	}
}

struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		let orderListFactory = OrderListFactory(selectedTab: .constant(1))
		let launchScreenManager = LaunchScreenManager()
		StartView(factory: orderListFactory, selectedTab: .constant(1))
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
		StartView(factory: orderListFactory, selectedTab: .constant(1))
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.preferredColorScheme(.dark)
		StartView(factory: orderListFactory, selectedTab: .constant(1))
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.previewLayout(.fixed(width: 568, height: 320))
		StartView(factory: orderListFactory, selectedTab: .constant(1))
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
