//
//  EncodableExtension.swift
//  MCRAvocado
//
//  Created by Onie on 29.10.2022.
//

import Foundation

extension Encodable {
	/// Transform Encodable into [String: Any]
	func asDictionary() throws -> [String: Any] {
		let data = try JSONEncoder().encode(self)
		guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
			throw NSError()
		}
		return dictionary
	}
}
