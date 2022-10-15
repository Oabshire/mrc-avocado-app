//
//  OrderListView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// List of ordered Items
struct OrderListView: View {

	/// Order with added items or empty
	@EnvironmentObject var order: Order

	var body: some View {
		NavigationView {
			List(order.orderedItems.sorted(by: <), id: \.key) { key, value in
				OrderRowView(menuItem: key, amount: value)
			}
			.navigationBarTitle("Order")
		}.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct OrderListView_Preview: PreviewProvider {
	static var previews: some View {
		OrderListView()
			.environmentObject(orderDataSource)
		OrderListView()
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		OrderListView()
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		OrderListView()
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
