//
//  OrderDetailView.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import SwiftUI

/// List of ordered Items
struct OrderDetailView: View {

	@Environment(\.verticalSizeClass ) var verticalSizeClass
	@Environment(\.horizontalSizeClass ) var horizontalSizeClass

	let order: OrderContainer

	var body: some View {
		GeometryReader { geometry in
			VStack {
				HeaderDetailView(order: order).frame(maxHeight: geometry.size.height / 5)
				List {
					Section(content: {
						ForEach(order.orderedItems.sorted(by: {$0.item > $1.item}), id: \.item) { orderedItems in
							CartRowView(menuItem: orderedItems.item, amount: orderedItems.amount)
								.listRowSeparator(.hidden)
						}
					}, header: {
						SectionHeader(text: "Ordered items:")
					})
				}
				.listStyle(.grouped)
			}.navigationTitle(order.status?.rawValue.capitalized ?? "")
		}
	}
}

struct OrderDetailView_Previews: PreviewProvider {
	static var previews: some View {
		OrderDetailView(order: OrderContainer(id: UUID(),
																					orderedItems: [],
																					totalAmount: 10,
																					dateOfCreation: Date(),
																					estimatedCompletionTime: Date(),
																					status: .inProgress))
	}
}
