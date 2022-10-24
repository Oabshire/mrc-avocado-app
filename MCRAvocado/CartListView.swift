//
//  CartListView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// List of ordered Items
struct CartListView: View {

	/// Order with added items or empty
	@EnvironmentObject var order: Order

	var body: some View {
		List(order.orderedItems.sorted(by: <), id: \.key) { key, value in
			CartRowView(menuItem: key, amount: value)
		}
		.navigationBarTitle("Cart")
	}
}

struct CartListView_Preview: PreviewProvider {
	static var previews: some View {
		CartListView()
			.environmentObject(orderDataSource)
		CartListView()
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		CartListView()
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		CartListView()
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
