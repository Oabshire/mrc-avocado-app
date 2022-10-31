//
//  OrderDetailView.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import SwiftUI

/// List of ordered Items
struct OrderDetailView: View {

	let order: OrderContainer

	var body: some View {
		VStack {
			if order.status == .completed {
				Text(order.status?.rawValue.capitalized ?? "")
					.font(.title)
					.foregroundColor(.onboardingAccentColor)
					.frame(alignment: .center)

					.listSectionSeparator(.hidden)
				Text("Completion time: " + (order.estimatedCompletionTime?.fullDateString ?? ""))
					.font(.title3)
					.frame(alignment: .center)
					.padding(5)
					.listSectionSeparator(.hidden)
			} else if order.status == .inProgress {
				Text(order.status?.rawValue.capitalized ?? "")
					.font(.title)
					.foregroundColor(.accentColor)
					.frame(alignment: .center)
					.listSectionSeparator(.hidden)
				Text("Estimated completion time: " + (order.estimatedCompletionTime?.toMinutesHoursString ?? ""))
					.font(.title3)
					.frame(alignment: .center)
					.padding(5)
					.listSectionSeparator(.hidden)
			}
			Text("Total: $" + String(order.totalAmount))
				.font(.title2)
				.frame(alignment: .center)
				.padding()
				.listSectionSeparator(.hidden)
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
		}
	}
}
