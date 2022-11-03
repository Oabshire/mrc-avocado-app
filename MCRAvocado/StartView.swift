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

	let factory: CartListFactory
	let discounts: [Discount] = Discount.getAllDiscounts

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
				}				.tag(1)

			// tab with ordered items
			factory.createCartList(order: order)
				.tabItem {
					Image(systemName: "cart")
						.resizable()
					Text("Cart")
				}
			// badge display amount of ordered items
				.badge(order.orderedItems.compactMap { $0.value }.reduce(0, +))
				.tag(2)

			// tab with orders
			OrdersListView()
				.tabItem {
					Image(systemName: "clock")
						.resizable()
					Text("Orders")
				}
				.tag(3)
		}.onChange(of: isLoading) { _ in
			launchScreenManager.dismiss()
		}
		.onAppear(perform: {
			order.loadJSONOrder()
		})
	}
}

struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		let orderListFactory = CartListFactory(selectedTab: .constant(1))
		let launchScreenManager = LaunchScreenManager()
		StartView(selectedTab: .constant(1), factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
		StartView(selectedTab: .constant(1), factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.preferredColorScheme(.dark)
		StartView(selectedTab: .constant(1), factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.previewLayout(.fixed(width: 568, height: 320))
		StartView(selectedTab: .constant(1), factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
