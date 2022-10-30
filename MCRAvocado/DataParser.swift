//
//  DataParser.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

import Foundation

/// protocol for data parser
protocol DataParserProtocol {
	func parse<T: Decodable>(data: Data) throws -> T
}

/// Json data parser
class DataParser: DataParserProtocol {
	private var jsonDecoder: JSONDecoder

	init(jsonDecoder: JSONDecoder = JSONDecoder()) {
		self.jsonDecoder = jsonDecoder
		self.jsonDecoder.dateDecodingStrategy = .iso8601
		self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
	}

	func parse<T: Decodable>(data: Data) throws -> T {
		guard let data = try? jsonDecoder.decode(T.self, from: data) else { throw NetworkError.failedToDecode }
		return data
	}
}
