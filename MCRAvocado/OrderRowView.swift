//
//  OrderRowView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// Cell for ordered items
struct OrderRowView: View {
	
	var menuItem: MenuItem
	
	@State var value: Int = 1
	
	var body: some View {
		HStack (alignment: .top) {
			Image(menuItem.imageName)
				.resizable()
				.frame(width: 60, height: 60)
				.cornerRadius(15)
			VStack(alignment: .leading) {
				VStack(alignment: .leading) {
					Text(menuItem.name)
						.font(.title2)

					HStack {
						Text("$ " + String(menuItem.price))
						Spacer()
						Stepper(value: $value, in: 1...99) {
							Text("× " + String(value)).foregroundColor(.black)
						}
					}
				}
				Text(menuItem.description ?? "")
					.frame(alignment: .leading)
			}
		}
	}}

struct OrderCellView_Preview: PreviewProvider {
	
	static var previews: some View {
		OrderRowView(menuItem: orderDataSource.orderedItems.first!.key)
		OrderRowView(menuItem: orderDataSource.orderedItems.first!.key).preferredColorScheme(.dark)
		OrderRowView(menuItem: orderDataSource.orderedItems.first!.key).previewLayout(.fixed(width: 568, height: 320))
		OrderRowView(menuItem: orderDataSource.orderedItems.first!.key).previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
