//
//  CartListFactory.swift
//  MCRAvocado
//
//  Created by Onie on 25.09.2022.
//

import SwiftUI

/// Factory to create screens for StartView
struct CartListFactory {
	/// Selected TabBar tab
	@Binding var selectedTab: Int

	/// Create screen for order tab
	/// - Parameter order: order
	/// - Returns: view with list of ordered items or screen with message if ordered items are empty
	@ViewBuilder func createCartList(order: Order) -> some View {
		NavigationView {
			switch order.orderedItems.isEmpty {
			case true :
				EmptyCartView()
			case false:
				CartListView(selectedTab: $selectedTab).environmentObject(order)
			}
		}.navigationViewStyle(StackNavigationViewStyle())
	}
}
