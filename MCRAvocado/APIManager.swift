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

	init(urlSession: URLSession = URLSession.shared) {		self.urlSession = urlSession
	}

	func perform(_ request: RequestProtocol) async throws -> Data {
		let (data, response) = try await urlSession.data(for: request.createURLRequest())
		let dataJSONURL = URL(fileURLWithPath: "AllMenu",
													relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
		try data.write(to: dataJSONURL, options: .atomicWrite)
		guard let httpResponse = response as? HTTPURLResponse,
					(200...299).contains(httpResponse.statusCode)
		else {
			throw NetworkError.invalidServerResponse
		}
		return data
	}
}

public extension FileManager {
	static var documentsDirectoryURL: URL {
		return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
	}
}
