//
//  OrderRowView.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import SwiftUI

/// Cell for ordered items
struct OrderRowView: View {

	/// Ordered menu item
	let order: OrderContainer
	var body: some View {
		HStack(alignment: .top) {

			if order.status  == .completed {
				Image(systemName: "checkmark.circle.fill")
					.font(.system(size: 30))
					.foregroundColor(.onboardingAccentColor)
			} else if order.status  == .inProgress {
				Image(systemName: "clock.fill")
					.font(.system(size: 30))
					.foregroundColor(.accentColor)
			}
			VStack(alignment: .leading) {
				Text(order.status?.rawValue.capitalized ?? "")
					.font(.title2)
				Text(order.dateOfCreation?.toMonthDayYearString ?? "")
					.font(.title2)
					.bold()
			}
			Spacer()
			Text(order.totalAmount.roundTwoAfterPoint ?? "")
				.font(.title3)
				.bold()
		}
	}
}

struct OrderRowView_Preview: PreviewProvider {
	static var previews: some View {

		let menuItem = MenuItemContainer(id: UUID(),
																		 name: "Blueberry pancake",
																		 price: 11.99,
																		 isInStock: true,
																		 calories: 610,
																		 description: "",
																		 type: .pancakes,
																		 imageUrl: nil,
																		 withIce: nil,
																		 typeOfMilk: nil,
																		 cupSize: nil)
		let order = OrderContainer(id: UUID(),
															 orderedItems: [OrderedItemContainer(item: menuItem,
																																	 amount: 1)],
															 totalAmount: 32.2,
															 dateOfCreation: Date(),
															 estimatedCompletionTime: Date(),
															 status: .completed)
		OrderRowView(order: order)
		OrderRowView(order: order)
			.preferredColorScheme(.dark)
		OrderRowView(order: order)
			.previewLayout(.fixed(width: 568, height: 320))
		OrderRowView(order: order)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
