//
//  OrderDetailView.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import SwiftUI

/// View for detail information about order
struct OrderDetailView: View {
	/// Order that contains information to display
	let order: OrderContainer

	// MARK: - Body
	var body: some View {
		GeometryReader { geometry in
			VStack {
				HeaderDetailView(order: order).frame(maxHeight: geometry.size.height / 5)
				List {
					Section(content: {
						ForEach(order.orderedItems.sorted(by: {$0.item > $1.item}), id: \.item) { orderedItems in
							OrderDetailRowView(isOrderCompleted: order.status == .completed,
																 menuItem: orderedItems.item,
																 amount: orderedItems.amount)
							.buttonStyle(.plain)
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
// MARK: - Preview
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
