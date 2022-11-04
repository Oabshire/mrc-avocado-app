//
//  DoubleExtesnsionsTests.swift
//  MCRAvocadoTests
//
//  Created by Onie on 03.11.2022.
//

import XCTest
@testable import Avocado

final class DoubleExtesnsionsTests: XCTestCase {
	func testToCurrencyString() {
		// arrange
		let doubleNumber: Double = 21.3455

		// act
		let resultString = doubleNumber.toCurrencyString

		// assecrt
		XCTAssertEqual(resultString, "$21.35")
	}
}
