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
	func createOrderList(order: Order) -> some View {
		if order.orderedItems.isEmpty {
			return AnyView(EmptyOrderView())
		} else {
			return  AnyView(OrderListView().environmentObject(order))
		}
	}
}
