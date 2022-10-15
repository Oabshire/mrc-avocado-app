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
		self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
	}

	func parse<T: Decodable>(data: Data) throws -> T {
		return try jsonDecoder.decode(T.self, from: data)
	}
}
