//
//  SaveDataManager.swift
//  MCRAvocado
//
//  Created by Onie on 15.10.2022.
//

import Foundation

class  SaveDataManager {

	let dataJSONURL = URL(fileURLWithPath: "AllMenu",
												relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")

	let dataPListURL = URL(fileURLWithPath: "PrioritizedTasks",
												 relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("plist")

	var menu: [MenuContainer] = [] {
		didSet {
			saveJSONPrioritizedTasks()
			savePListPrioritizedTasks()
		}
	}

	init() {
    loadJSONPrioritizedTasks()
		loadPListPrioritizedTasks()
	}

	private func saveJSONPrioritizedTasks() {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted

		do {
			let menuData = try encoder.encode(menu)
			try menuData.write(to: dataJSONURL, options: .atomicWrite)
		} catch let error {
			print(error)
		}
	}

	private func savePListPrioritizedTasks() {
		let encoder = PropertyListEncoder()
		encoder.outputFormat = .xml

		do {
			let menuData = try encoder.encode(menu)
			try menuData.write(to: dataPListURL, options: .atomicWrite)
		} catch let error {
			print(error)
		}
	}

	private func loadJSONPrioritizedTasks() {
		guard FileManager.default.fileExists(atPath: dataJSONURL.path) else {
			return
		}

		let decoder = JSONDecoder()

		do {
			let menuData = try Data(contentsOf: dataJSONURL)
			menu = try decoder.decode([MenuContainer].self, from: menuData)
			print("-------JSON DATA --------")
			print(menu)
		} catch let error {
			print(error)
		}
	}

	private func loadPListPrioritizedTasks() {
		guard FileManager.default.fileExists(atPath: dataPListURL.path) else {
			return
		}

		let decoder = PropertyListDecoder()

		do {
			let menuData = try Data(contentsOf: dataPListURL)
			menu = try decoder.decode([MenuContainer].self, from: menuData)
			print("-------Plist DATA --------")
			print(menu)
		} catch let error {
			print(error)
		}
	}
}
