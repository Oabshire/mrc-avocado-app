//
//  EncodableExtensionTests.swift
//  MCRAvocadoTests
//
//  Created by Onie on 03.11.2022.
//

import XCTest
@testable import Avocado

final class EncodableExtensionTests: XCTestCase {
	struct CodableStructForTest: Codable {
		let name: String
		let amount: Int
	}
	func asDictionary() throws {
		// arrange
		let codableObjectForTest = CodableStructForTest(name: "My Name", amount: 5)
		// act
		let result =  try codableObjectForTest.asDictionary()

		//assert
		XCTAssertEqual(result.count, 2)
		XCTAssertEqual(result.first?.key, "name" )
	}
}
