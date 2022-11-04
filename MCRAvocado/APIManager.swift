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

	// MARK: - Init
	init(urlSession: URLSession = URLSession.shared) {
		self.urlSession = urlSession
	}

	// MARK: - APIManagerProtocol
	func perform(_ request: RequestProtocol) async throws -> Data {
		let (data, response) = try await urlSession.data(for: request.createURLRequest())
		guard let httpResponse = response as? HTTPURLResponse,
					(200...299).contains(httpResponse.statusCode)
		else {
			throw NetworkError.invalidServerResponse
		}
		return data
	}
}
