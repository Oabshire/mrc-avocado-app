//
//  RequestManager.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

/// Protocol for RequestManager
protocol RequestManagerProtocol {

	/// Perform request
	/// - Parameter request: request
	/// - Returns: instant of decodable type
	func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

final class RequestManager: RequestManagerProtocol {
	/// APIManager that conforms APIManagerProtocol
	let apiManager: APIManagerProtocol
	/// DataParser that conforms DataParserProtocol
	let parser: DataParserProtocol

	// MARK: - Init
	/// Init
	/// - Parameters:
	///   - apiManager: APIManager that conforms APIManagerProtocol
	///   - parser: DataParser that conforms DataParserProtocol
	init(
		apiManager: APIManagerProtocol = APIManager(),
		parser: DataParserProtocol = DataParser()
	) {
		self.apiManager = apiManager
		self.parser = parser
	}

	// MARK: - RequestManagerProtocol
	func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
		let data = try await apiManager.perform(request)
		guard let decoded: T = try parser.parse(data: data) else {
			throw NetworkError.failedToDecode
		}
		return decoded
	}
}
