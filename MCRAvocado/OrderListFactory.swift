//
//  OrderListFactory.swift
//  MCRAvocado
//
//  Created by Onie on 25.09.2022.
//

import SwiftUI

/// Factory to create screens for StartView
struct OrderListFactory {

	/// Create screen for order tab
	/// - Parameter order: order
	/// - Returns: view with list of ordered items or screen with message if ordered items are empty
	@ViewBuilder func createOrderList(order: Order) -> some View {
		switch order.orderedItems.isEmpty {
		case true :
			EmptyOrderView()
		case false:
			OrderListView().environmentObject(order)
		}
	}
}
