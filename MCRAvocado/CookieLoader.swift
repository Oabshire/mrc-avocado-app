//
//  CookieLoader.swift
//  MCRAvocado
//
//  Created by Onie on 08.10.2022.
//

import SwiftUI

/// Cookie Loader with modern concurrency
class CookieLoader {

	// MARK: Cookie Load Error
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

		// try to get fields
		let (_, response) = try await URLSession.shared.data(from: url)
		guard let httpResponse = response as? HTTPURLResponse,
					let fields = httpResponse.allHeaderFields as? [String: String]
		else {
			throw CookieLoadError.invalidResponse
		}

		// get cookie
		let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)
		await MainActor.run {
			print("*-----------Cookies----------*")
			print(cookies)
		}
	}
}
