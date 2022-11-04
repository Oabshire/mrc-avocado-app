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

	/// Manager of lunchScreen to control AnimationView
	@EnvironmentObject var launchScreenManager: LaunchScreenManager
	/// Order that contains ordered items and discounts
	@EnvironmentObject var order: Order
	/// Selected tab
	@Binding var selectedTab: Int
	/// State of Menu loading (Dismiss animation if false)
	@State var isLoading = true

	/// Factory of Cart tab View
	let factory: CartListFactory

	/// All discounts for DiscountView
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

// MARK: - Preview
struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		let orderListFactory = CartListFactory(selectedTab: .constant(1))
		let launchScreenManager = LaunchScreenManager()
		//		let context = PersistenceController.preview.container.viewContext
		StartView(selectedTab: .constant(3), factory: orderListFactory)
			.environmentObject(orderDataSource)
			.environmentObject(launchScreenManager)
		//			.environment(\.managedObjectContext, context)
	}
}
