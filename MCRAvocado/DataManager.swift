//
//  DataManager.swift
//  MCRAvocado
//
//  Created by Onie on 16.10.2022.
//

import SwiftUI

class DataManager {
	private let requestManager = RequestManager()

	func getMenu() async -> [MenuSectionContainer] {
		do {
			let sectionContainer: [MenuSectionContainer] = try await requestManager.perform(MenuRequest.getAllMenu)
			return sectionContainer
		} catch let error {
			print(error.localizedDescription)
			return []
		}
	}
}
