//
//  OrdersListView.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import SwiftUI

/// List of Orders
struct OrdersListView: View {
	/// NetworkReachability to check network connection
	@EnvironmentObject var network: NetworkReachability
/// Is order confirmation view shows
	@State var isOrderConfShows = false
	/// All orders
	@State var orders: [SectionalOrderModel] = []

// MARK: - Body
	var body: some View {
		NavigationView {
			if !orders.isEmpty {
				List {
					ForEach(orders.sorted(by: { $0.dateOfFirstOrder > $1.dateOfFirstOrder}), id: \.sectionName) { section in
						Section(content: {
							ForEach(section.orders.sorted(by: >), id: \.id) { item in
								NavigationLink(
									destination: OrderDetailView(order: item)) {
										OrderRowView(order: item)
									}
							}
						}, header: {
							SectionHeader(text: section.sectionName)
						})
					}
				}
				.navigationTitle("Orders")
			} else {
				EmptyOrdersView()
					.navigationTitle("Orders")
			}
		}
		.onChange(of: network.isConnected) { _ in
			if network.isConnected {
				Task {
					await getOrders()
				}
			}
		}
		.navigationViewStyle(StackNavigationViewStyle())
		.task { await getOrders() }
	}
}

// MARK: - Private
private extension OrdersListView {
	func getOrders() async {
		do {
			let dataManager = DataManager()
			let orders: [OrderContainer] = try await dataManager.getOrders()
			await stopLoading(with: orders)
		} catch {
			print(error.localizedDescription)
		}
	}

	@MainActor
	func stopLoading(with orders: [OrderContainer]) async {
		self.orders = SectionalOrdersAdapter.sectionOrders(from: orders)
	}
}

// MARK: - Preview
struct OrdersListView_Preview: PreviewProvider {
	static var previews: some View {
		CartListView(selectedTab: .constant(2))
			.environmentObject(orderDataSource)
	}
}
