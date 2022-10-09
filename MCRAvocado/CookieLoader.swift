//
//  CookieLoader.swift
//  MCRAvocado
//
//  Created by Onie on 08.10.2022.
//

import SwiftUI

// MARK: Song Downloader
class CookieLoader {

	// MARK: Song Download Error
	enum CookieLoadError: Error {
		case invalidURL
		case invalidResponse
	}

	private let session: URLSession
	private let sessionConfiguration: URLSessionConfiguration

	// MARK: Initialization
	init() {
		self.sessionConfiguration = URLSessionConfiguration.default
		self.session = URLSession(configuration: sessionConfiguration)
	}

	func downloadCookie(from cookieURL: String) async throws {
		// create url from string
		guard let url = URL(string: "https://www.raywenderlich.com") else {
			throw CookieLoadError.invalidURL
		}

		let (_, response) = try await URLSession.shared.data(from: url)
		guard let httpResponse = response as? HTTPURLResponse,
					let fields = httpResponse.allHeaderFields as? [String: String]
		else {
			throw CookieLoadError.invalidResponse
		}

		let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)
		await MainActor.run {
			print("*-----------Cookies----------*")
			print(cookies)
		}
	}
}
