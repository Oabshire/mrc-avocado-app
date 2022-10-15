//
//  APIManager.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

import Foundation

/// Protocol for APIManager
protocol APIManagerProtocol {

	/// Get data from request
	/// - Parameter request: request
	/// - Returns: data
	func perform(_ request: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {
	private let urlSession: URLSession

	init(urlSession: URLSession = URLSession.shared) {
		self.urlSession = urlSession
	}

	func perform(_ request: RequestProtocol) async throws -> Data {
		let (data, response) = try await urlSession.data(for: request.createURLRequest())
		guard let httpResponse = response as? HTTPURLResponse,
					httpResponse.statusCode == 200 else { throw NetworkError.invalidServerResponse }
		return data
	}
}
