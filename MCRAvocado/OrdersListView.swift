//
//  OrdersListView.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import SwiftUI

/// List of ordered Items
struct OrdersListView: View {

	@State var isOrderConfShows = false
	@State var orders: [SectionalOrderModel] = []

	@State var lastErrorMessage = "" {
		didSet { isDisplayingError = true }
	}
	@State var isDisplayingError = false

	var body: some View {
		NavigationView {
			if !orders.isEmpty {
				List {
					ForEach(orders.sorted(by: { $0.first > $1.first}), id: \.monthYearString) { section in
						Section(content: {
							ForEach(section.orders, id: \.id) { item in
								NavigationLink(
									destination: OrderDetailView(order: item)) {
										OrderRowView(order: item)
									}
							}
						}, header: {
							SectionHeader(text: section.monthYearString)
						})
					}
				}
				.navigationBarTitle("Orders")
			} else {
				EmptyOrdersView()
					.navigationBarTitle("Orders")
			}
		}

		.task { await getOrders() }
		.alert("Error", isPresented: $isDisplayingError, actions: {
			Button("Try again", role: .cancel) { Task { await getOrders() } }
		}, message: {
			Text(lastErrorMessage)
		})
	}
}

private extension OrdersListView {
	func getOrders() async {
		do {
			let dataManager = DataManager()
			let orders: [OrderContainer] = try await dataManager.getOrders()
			await stopLoading(with: orders)
		} catch {
			lastErrorMessage = error.localizedDescription
		}
	}

	@MainActor
	func stopLoading(with orders: [OrderContainer]) async {
		self.orders = SectionalOrdersAdapter().sectionOrders(from: orders)
	}
}

struct OrdersListView_Preview: PreviewProvider {
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
