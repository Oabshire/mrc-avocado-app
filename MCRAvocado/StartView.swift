//
//  StartView.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

/// First view that user sees
struct StartView: View {

	@EnvironmentObject var launchScreenManager: LaunchScreenManager
	@EnvironmentObject var order: Order
	@EnvironmentObject var dataManager: DataManager
	@State var selectedTab = 1
	@State var isLoading = true
	//	private let saveDataManager = SaveDataManager()

	let factory: OrderListFactory

	let discounts: [Discount] = discountDataSource

	init(factory: OrderListFactory) {
		self.factory = factory
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
			MenuListView(dataSource: dataManager.menu).environmentObject(order)
				.tabItem {
					Image(systemName: "menucard")
						.resizable()
					Text("Menu")
				}
			// badge display amount of menu items
				.badge(dataManager.menu.flatMap { $0.menuItems }.filter { $0.isInStock }.count)
				.tag(1)

			// tab with ordered items
			factory.createOrderList(order: order)
				.tabItem {
					Image(systemName: "cart")
						.resizable()
					Text("Order")
				}
			// badge display amount of ordered items
				.badge(order.orderedItems.count)
				.tag(2)
		}
		.task {
			await dataManager.fetchMenu()
			if !dataManager.isLoading {
				launchScreenManager.dismiss()
			}
		}
	}
}

struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		let orderListFactory = OrderListFactory()
		let launchScreenManager = LaunchScreenManager()
		StartView(factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
		StartView(factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.preferredColorScheme(.dark)
		StartView(factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.previewLayout(.fixed(width: 568, height: 320))
		StartView(factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
