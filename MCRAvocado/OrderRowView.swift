//
//  OrderRowView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// Cell for ordered items
struct OrderRowView: View {

	/// Ordered menu item
	var menuItem: MenuItem

	/// Amount of ordered menu items
	var amount: Int
	
	var body: some View {
		HStack (alignment: .top) {
			Image(menuItem.imageName)
				.resizable()
				.frame(width: Constants.General.rowImageWidthHeight,
							 height: Constants.General.rowImageWidthHeight)
				.cornerRadius(Constants.General.rowImageCornerRadius)
			VStack(alignment: .leading) {
				Text(menuItem.name)
					.font(.title2)

				Text("$ " + String(menuItem.price) + " × " + String(amount))
			}
		}
	}
}

struct OrderCellView_Preview: PreviewProvider {
	
	static var previews: some View {
		OrderRowView(menuItem: orderDataSource.orderedItems.first!.key, amount: 1)
		OrderRowView(menuItem: orderDataSource.orderedItems.first!.key, amount: 1)
			.preferredColorScheme(.dark)
		OrderRowView(menuItem: orderDataSource.orderedItems.first!.key, amount: 1)
			.previewLayout(.fixed(width: 568, height: 320))
		OrderRowView(menuItem: orderDataSource.orderedItems.first!.key, amount: 1)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
