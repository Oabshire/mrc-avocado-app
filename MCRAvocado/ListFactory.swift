//
//  ListFactory.swift
//  MCRAvocado
//
//  Created by Onie on 25.09.2022.
//

import SwiftUI

/// Factory to create screens for StartView
struct ListFactory {
	
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
	
	/// Create screen for menu tab
	/// - Parameters:
	///   - menu: menu
	///   - order: order in which the ordered dishes placed
	/// - Returns: list of menuItems
	func createMenuList(menu: MenuModel, order: Order) -> some View  {
		return MenuListView(dataSource: menu).environmentObject(order)
	}

	/// Create screen for discounts tab
	/// - Parameter discounts: discounts
	/// - Returns: grid of discounts
	func createDiscountGrid(discounts: [Discount])-> some View  {
		return DiscountGridView(discountsDataSource: discounts)
	}
}
