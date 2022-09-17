//
//  OrderView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// SwiftUI Table for ordered items
struct OrderView: View {
	
	@StateObject var order: Order = orderDataSource
	
	@Binding var orderIsShowing: Bool
	var body: some View {
		NavigationView {
			ZStack {
				Color.mainBackgroundColor
					.edgesIgnoringSafeArea(.all)
				ScrollView{
					ForEach(order.orderedItems.sorted(by:<), id: \.key) { key, value in
						OrderCellView(menuItem: key).padding(5)
					}
				}
			}
			.navigationBarTitle(TextLibrary.AppTexts.cartText)
			.navigationBarItems(leading: Button(action: { orderIsShowing = false}) {
				Text("Done")
			})
		}
	}
}

struct OrderView_Preview: PreviewProvider {
	
	static var previews: some View {
		OrderView(orderIsShowing: .constant(false))
		OrderView(orderIsShowing: .constant(false)).preferredColorScheme(.dark)
		OrderView(orderIsShowing: .constant(false)).previewLayout(.fixed(width: 568, height: 320))
		OrderView(orderIsShowing: .constant(false)).previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
