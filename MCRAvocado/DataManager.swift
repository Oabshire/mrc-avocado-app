//
//  DataManager.swift
//  MCRAvocado
//
//  Created by Onie on 16.10.2022.
//

import SwiftUI

class DataManager {
	private let requestManager = RequestManager()

	/// Get menu
	/// - Returns: array of MenuSectionContainer
	func getMenu() async throws -> [MenuSectionContainer] {
		return try await requestManager.perform(MenuRequest.getAllMenu)
	}

	/// Post order
	/// - Parameter order: order to post
	/// - Returns: posted order
	func postOrder(order: OrderContainer) async -> OrderContainer? {
		do {
			let parameters = try order.asDictionary()
			let orderContainer: OrderContainer = try await requestManager.perform(OrderRequest.postOrder(params: parameters))
			return orderContainer
		} catch let error {
			print(error.localizedDescription)
			return nil
		}
	}

	/// get order
	/// - Returns: array of OrderContainer
	func getOrders() async throws -> [OrderContainer] {
		return try await requestManager.perform(OrderRequest.getOrder)
	}

	/// Get current date
	/// - Returns: date
	func getCurrentDate() async throws -> Date {
		let dateContainer: DateContainer = try await requestManager.perform(DateRequest.getCurrentDate)
		return dateContainer.currentDate
	}
}
