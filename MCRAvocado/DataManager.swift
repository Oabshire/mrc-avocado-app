//
//  DataManager.swift
//  MCRAvocado
//
//  Created by Onie on 16.10.2022.
//

import SwiftUI

class DataManager {
	private let requestManager = RequestManager()

	func getMenu() async throws -> [MenuSectionContainer] {
			let sectionContainer: [MenuSectionContainer] = try await requestManager.perform(MenuRequest.getAllMenu)
			return sectionContainer
	}

	func postOrder(order: OrderContainer) async -> OrderContainer? {
		do {
			let parameters = try order.asDictionary()
			let orderContainer: OrderContainer = try await requestManager.perform(PostOrderRequest.postOrder(params: parameters))
			return orderContainer
		} catch let error {
			print(error.localizedDescription)
			return nil
		}
	}
}
