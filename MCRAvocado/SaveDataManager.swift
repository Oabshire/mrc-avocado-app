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

	let dataPListURL = URL(fileURLWithPath: "Menu",
												 relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("plist")

	var menu: [MenuSectionContainer] = [] {
		didSet {
			saveJSONMenu()
			savePListMenu()
		}
	}

	init() {
    loadJSONMenu()
		loadPListMenu()
	}

	private func saveJSONMenu() {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted

		do {
			let menuData = try encoder.encode(menu)
			try menuData.write(to: dataJSONURL, options: .atomicWrite)
		} catch let error {
			print(error)
		}
	}

	private func savePListMenu() {
		let encoder = PropertyListEncoder()
		encoder.outputFormat = .xml

		do {
			let menuData = try encoder.encode(menu)
			try menuData.write(to: dataPListURL, options: .atomicWrite)
		} catch let error {
			print(error)
		}
	}

	private func loadJSONMenu() {
		guard FileManager.default.fileExists(atPath: dataJSONURL.path) else {
			return
		}

		let decoder = JSONDecoder()

		do {
			let menuData = try Data(contentsOf: dataJSONURL)
			menu = try decoder.decode([MenuSectionContainer].self, from: menuData)
			print("-------JSON DATA --------")
			print(menu)
		} catch let error {
			print(error)
		}
	}

	private func loadPListMenu() {
		guard FileManager.default.fileExists(atPath: dataPListURL.path) else {
			return
		}

		let decoder = PropertyListDecoder()

		do {
			let menuData = try Data(contentsOf: dataPListURL)
			menu = try decoder.decode([MenuSectionContainer].self, from: menuData)
			print("-------Plist DATA --------")
			print(menu)
		} catch let error {
			print(error)
		}
	}
}
