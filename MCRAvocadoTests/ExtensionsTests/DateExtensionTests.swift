//
//  DateExtensionTests.swift
//  MCRAvocadoTests
//
//  Created by Onie on 03.11.2022.
//

import XCTest
@testable import Avocado

final class DateExtensionTests: XCTestCase {
	func testToMonthYearString() {
		// arrange
		let date = Date("2022-11-21")

		// act
		let stringDate = date.toMonthYearString

		// assert
		XCTAssertEqual(stringDate, "November 2022")
	}

	func testToMonthDayYearString() {
		// arrange
		let date = Date("2022-11-21")

		// act
		let stringDate = date.toMonthDayYearString

		// assert
		XCTAssertEqual(stringDate, "Nov 21 2022")
	}

	func testToMinutesHoursString() {
		// arrange
		let date = Date("2022-11-21")

		// act
		let stringDate = date.toMinutesHoursString

		// assert
		XCTAssertEqual(stringDate, "12:00 AM")
	}

	func testfullDateString() {
		// arrange
		let date = Date("2022-11-21")

		// act
		let stringDate = date.fullDateString

		// assert
		XCTAssertEqual(stringDate, "2022.11.21 12:00 AM")
	}

	func testGetComponents() {
		// arrange
		let date = Date("2022-11-21")

		// act
		let components = date.get(.day, .year, .month)

		// assert
		XCTAssertEqual(components, DateComponents.init(year: 2022 , month : 11, day: 21))
	}

	func testGetComponent() {
		// arrange
		let date = Date("2022-11-21")

		// act
		let day = date.get(.day)
		let month = date.get(.month)
		let year = date.get(.year)

		// assert
		XCTAssertEqual(day, 21)
		XCTAssertEqual(month, 11)
		XCTAssertEqual(year, 2022)
	}
}
