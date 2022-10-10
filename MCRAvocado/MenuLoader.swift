//
//  MenuLoader.swift
//  MCRAvocado
//
//  Created by Onie on 07.10.2022.
//

import SwiftUI

// MARK: Song Downloader
class MenuLoader {
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

		// try to get Data and URLResponse
		let (data, response) = try await session.data(from: url)
		// validate responce code
		guard let menuHTTPResponse = response as? HTTPURLResponse,
					menuHTTPResponse.statusCode == 200
		else {
			throw MenuLoadError.invalidResponse
		}
		let decoder = JSONDecoder()

		// try to decode data
		do {
			let menu = try decoder.decode(DownloadedMenuItems.self, from: data)
			//			 print data and decoded object
			await MainActor.run {
				print("DownloadedData: \(data)")
				print("*-----------Menu----------*")
				print(menu)
			}
		} catch {
			throw MenuLoadError.failedToDecode
		}
	}
}


extension MenuLoader.MenuLoadError: LocalizedError {
		public var errorDescription: String? {
				switch self {
				case .invalidURL:
					return NSLocalizedString("Provided url string is not convertible to URL type",
																	 comment: "invalid URL")
				case .invalidResponse:
					return NSLocalizedString("The response received has an invalid status code.",
																	 comment: "invalidResponse")
				case .failedToDecode:
					return NSLocalizedString("Something went wrong while decoding. Make sure the keys and types are correct.",
																	 comment: "failed To Decode")
				}
		}
}
