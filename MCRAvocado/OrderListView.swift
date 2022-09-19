//
//  OrderListView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// SwiftUI Table for ordered items
struct OrderListView: View {
	@EnvironmentObject var order: Order

	var body: some View {
		if order.orderedItems.isEmpty {
			VStack{
				Image(systemName: "cart")
					.font(.system(size: 100))
				Text("Your Cart is empty")
					.font(.title3)
					.padding()
			}
		} else {
			NavigationView {
				List(order.orderedItems.sorted(by:<), id: \.key) { key, value in
					OrderRowView(menuItem: key, value: value)
				}
				.navigationBarTitle("Order")
			}.navigationViewStyle(StackNavigationViewStyle())
		}
	}
}

struct OrderListView_Preview: PreviewProvider {
	
	static var previews: some View {
		OrderListView()
		OrderListView().preferredColorScheme(.dark)
		OrderListView().previewLayout(.fixed(width: 568, height: 320))
		OrderListView().previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
