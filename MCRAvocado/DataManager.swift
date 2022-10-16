//
//  DataManager.swift
//  MCRAvocado
//
//  Created by Onie on 16.10.2022.
//

import Foundation
class DataManager: ObservableObject {
	@Published var isLoading = true
	@Published var menu: [MenuContainer] = []

	private let requestManager = RequestManager()

	func fetchMenu() async {
		do {
			let menuContainer: [MenuContainer] = try await requestManager.perform(MenuRequest.getAllMenu)

			//			saveDataManager.menu = menu
			await stopLoading(with: menuContainer)
		} catch let error {
			print(error.localizedDescription)
		}
	}

	@MainActor
	func stopLoading(with menuContainer: [MenuContainer]) async {
		self.menu = menuContainer
		isLoading = false
	}
}
