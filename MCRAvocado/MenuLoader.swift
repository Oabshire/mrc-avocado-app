//
//  MenuLoader.swift
//  MCRAvocado
//
//  Created by Onie on 07.10.2022.
//

import SwiftUI

// MARK: Song Downloader
class MenuLoader: ObservableObject {

	// MARK: Song Download Error
	enum SongDownloadError: Error {
		case documentDirectoryError
		case failedToStoreSong
		case invalidResponse
	}

	private let session: URLSession
	private let sessionConfiguration: URLSessionConfiguration

	// MARK: Initialization
	init() {
		self.sessionConfiguration = URLSessionConfiguration.default
		self.session = URLSession(configuration: sessionConfiguration)
	}

	func download(menuAt menuURL: String) async throws {
		guard let url = URL(string: menuURL)
		else {
			print("Error downloading song.")
			return
		}

		typealias Download = (_ data: Data, _ response: URLResponse)

		async let response: Download = try session.data(from: url)

		guard let menuHTTPResponse = try await response.response as? HTTPURLResponse,
					menuHTTPResponse.statusCode == 200
		else {
			print("Invalid response code.")
			return
		}

		let decoder = JSONDecoder()

		do {
			let menuData = try await response.data
			let menu = try decoder.decode(DownloadedMenuItems.self, from: menuData)
			await MainActor.run {
				print(menuData)
				print(menu)
			}
		} catch let error {
			print("ERROR: \(error)")
		}
	}
}
