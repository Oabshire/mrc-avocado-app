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
	@State var selectedTab = 1
	@State var isLoading = true
	private let requestManager = RequestManager()
	private let saveDataManager = SaveDataManager()

	let factory: OrderListFactory
	@State var menu: [MenuContainer] = []

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
				.badge(discounts.count) // badge display amount of discount
				.tag(0)

			// tab with menu
			MenuListView(dataSource: menu).environmentObject(order)
				.tabItem {
					Image(systemName: "menucard")
						.resizable()
					Text("Menu")
				}
				.badge(menu.flatMap { $0.menuItems }.filter { $0.isInStock }.count) // badge display amount of menu items
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
		.task {
			await fetchMenu()
		}
	}
}

private extension StartView {
	func fetchMenu() async {
		do {
			let menuContainer: [MenuContainer] = try await requestManager.perform(MenuRequest.getAllMenu)
			self.menu = menuContainer
			saveDataManager.menu = menu
			await stopLoading()
		} catch let error {
			print(error.localizedDescription)
		}
	}

	@MainActor
	func stopLoading() async {
		isLoading = false
		launchScreenManager.dismiss()
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
