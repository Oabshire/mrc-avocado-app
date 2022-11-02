//
//  SectionalOrdersAdapterTests.swift
//  MCRAvocadoTests
//
//  Created by Onie on 01.11.2022.
//

import XCTest
@testable import Avocado

final class SectionalOrdersAdapterTests: XCTestCase {
	private var sut: SectionalOrdersAdapter!

	override func setUpWithError() throws {
		super.setUp()
		sut = SectionalOrdersAdapter()
	}

	override func tearDownWithError() throws {
		sut = nil
		super.tearDown()
	}
}

extension SectionalOrdersAdapterTests {
	func test() {
		// arrange
		let firstOrder = OrderContainer(id: UUID(),
																		orderedItems: [],
																		totalAmount: 10,
																		dateOfCreation: Date("2022-10-20"),
																		estimatedCompletionTime: nil,
																		status: .completed)
		let secondOrder = OrderContainer(id: UUID(),
																		 orderedItems: [],
																		 totalAmount: 10,
																		 dateOfCreation: Date("2022-11-20"),
																		 estimatedCompletionTime: nil,
																		 status: .completed)
		let thirdOrder = OrderContainer(id: UUID(),
																		orderedItems: [],
																		totalAmount: 10,
																		dateOfCreation: Date("2022-11-21"),
																		estimatedCompletionTime: nil,
																		status: .completed)
		let orders = [firstOrder, secondOrder, thirdOrder]

		// act
		let result = sut.sectionOrders(from: orders)

		// assert
		XCTAssertEqual(result.first?.sectionName, secondOrder.dateOfCreation?.toMonthYearString)
		XCTAssertEqual(result.first?.orders.count, 2)

		XCTAssertEqual(result.last?.sectionName, firstOrder.dateOfCreation?.toMonthYearString)
		XCTAssertEqual(result.last?.orders.count, 1)
	}
}
