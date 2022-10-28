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

//	init() {
//		UITableView.appearance().backgroundColor = UIColor.mainBackgroundColor
//	}

	var body: some View {
		List {
			ForEach(order.orderedItems.sorted(by: <), id: \.key) {key, value in
				CartRowView(menuItem: key, amount: value)
			}
			.onDelete(perform: delete)
		}
		.navigationBarTitle("Cart")
	}

	func delete(at offsets: IndexSet) {
		order.removeItem(at: offsets)
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
