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
	enum MenuLoadError: Error {
		case invalidURL
		case invalidResponse
		case failedToDecode
	}

	private let session: URLSession
	private let sessionConfiguration: URLSessionConfiguration

	// MARK: Initialization
	init() {
		self.sessionConfiguration = URLSessionConfiguration.default
		self.session = URLSession(configuration: sessionConfiguration)
	}

	func download(menuAt menuURL: String) async throws {
		// create url from string
		guard let url = URL(string: menuURL)
		else {
			throw MenuLoadError.invalidURL
		}

		typealias Download = (_ data: Data, _ response: URLResponse)

		// try to get Data and URLResponse
		async let response: Download = try session.data(from: url)
		// validate responce code
		guard let menuHTTPResponse = try await response.response as? HTTPURLResponse,
					menuHTTPResponse.statusCode == 200
		else {
			throw MenuLoadError.invalidResponse
		}

		let decoder = JSONDecoder()

		// try to decode data
		do {
			let menuData = try await response.data
			let menu = try decoder.decode(DownloadedMenuItems.self, from: menuData)
			// print data and decoded object
			await MainActor.run {
				print(menuData)
				print(menu)
			}
		} catch {
			throw MenuLoadError.failedToDecode
		}
	}
}
