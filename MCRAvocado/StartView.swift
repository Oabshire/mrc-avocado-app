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
	@State var isActive = false

	let factory: OrderListFactory
	let menu: MenuModel = menuDataSource
	let discounts: [Discount] = discountDataSource

	init(factory: OrderListFactory) {
		self.factory = factory
		let opaqueAppearance = UITabBarAppearance()
		opaqueAppearance.configureWithOpaqueBackground()
		UITabBar.appearance().scrollEdgeAppearance = opaqueAppearance
	}

	var body: some View {
		if isActive {
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
			}.onAppear(perform: {
				Task {
					await getCoockies()
				}
			})
		}
		else {
			SplashView()
				.onAppear{
					DispatchQueue.main.asyncAfter(deadline: .now() + 4.4) {
						withAnimation {
							isActive = true
						}
					}
				}
		}
	}
}

private extension StartView {
	func getCoockies() async {
		let loader = CookieRWLoader()
		do {
			try await loader.downloadCookie(from: "https://www.raywenderlich.com")
		}
		catch let error {
			print("ERROR: \(error)")
		}
	}
}

struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		let orderListFactory = OrderListFactory()
		StartView(factory: orderListFactory)
			.environmentObject(orderDataSource)
		StartView(factory: orderListFactory)
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		StartView(factory: orderListFactory)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		StartView(factory: orderListFactory)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
