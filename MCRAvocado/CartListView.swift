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
	@State var isOrderConfShows = false
	@Binding var selectedTab: Int

	var body: some View {
		List {
			ForEach(order.orderedItems.sorted(by: <), id: \.key) {key, value in
				CartRowView(menuItem: key, amount: value)
			}
			.onDelete(perform: delete)
		}
		.safeAreaInset(edge: .bottom) {
			ZStack {
				LinearGradient(gradient: Gradient(colors:[Color.clear, Color.defaultBackgroundColor, Color.defaultBackgroundColor]),
											 startPoint: .top,
											 endPoint: .bottom)
				.frame(height: 100)

				BottomButton(text: "Place order", color: .onboardingAccentColor) {
					let orderToPost = OrderAdapter.adaptToPost(from: order)
					isOrderConfShows = true
					Task {
						await postOrder(orderToPost)
					}
				}
				.padding()
				.fullScreenCover(isPresented: $isOrderConfShows) {
					OrderConfirmationView(isOrderPlaced: $isOrderConfShows, selectedTab: $selectedTab).environmentObject(order)
				}
			}
		}
		.navigationBarTitle("Cart")
	}
}

private extension CartListView {
	func delete(at offsets: IndexSet) {
		order.removeItem(at: offsets)
	}

	func postOrder(_ order: OrderContainer) async {
		let dataManager = DataManager()
		if let _: OrderContainer = await dataManager.postOrder(order: order) {
			isOrderConfShows = true
		}
	}
}

struct CartListView_Preview: PreviewProvider {
	static var previews: some View {
		CartListView(selectedTab: .constant(2))
			.environmentObject(orderDataSource)
		CartListView(selectedTab: .constant(2))
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		CartListView(selectedTab: .constant(2))
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		CartListView(selectedTab: .constant(2))
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
