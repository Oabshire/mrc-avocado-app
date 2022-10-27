//
//  OrderModelTests.swift
//  MCRAvocadoTests
//
//  Created by Onie on 28.08.2022.
//

import XCTest
@testable import Avocado

final class OrderModelTests: XCTestCase {
	private var sut: Order!
	private var menuItem: MenuItem!

	override func setUpWithError() throws {
		super.setUp()
		menuItem = MenuItem(name: "Oatmeal",
												price: 10.70,
												isInStock: true,
												calories: 500,
												description: "Some description",
												type: .oatmeal)
		sut = Order(orderedItems: [menuItem: 2])
	}

	override func tearDownWithError() throws {
		menuItem = nil
		sut = nil
		super.tearDown()
	}
}

// MARK: - Test addMenuItem
extension OrderModelTests {
	func testAddNewMenuItemIsInStock() {
		// arrange
		menuItem = MenuItem(name: "Blueberry pancake",
												price: 4.5,
												isInStock: true,
												calories: 610,
												description: "",
												type: .pancakes)
		// act
		let result = sut.addMenuItem(item: menuItem, amount: 1)

		// assert
		XCTAssertTrue(result)
		XCTAssertEqual(sut.orderedItems[menuItem], 1)
	}

	func testAddNewMenuItemIsOutStock() {
		// arrange
		menuItem = MenuItem(name: "Blueberry pancake",
												price: 4.5,
												isInStock: false,
												calories: 610,
												description: "",
												type: .pancakes)
		// act
		let result = sut.addMenuItem(item: menuItem, amount: 1)

		// assert
		XCTAssertFalse(result)
		XCTAssertNil(sut.orderedItems[menuItem])
	}

	func testAddExistingMenuItemIsOutStock() {
		// arrange & act
		let result = sut.addMenuItem(item: menuItem, amount: 1)

		// assert
		XCTAssertTrue(result)
		XCTAssertEqual(sut.orderedItems[menuItem], 3)
	}
}

// MARK: - Test amountWithoutDiscount
extension OrderModelTests {
	func testAmountWithoutDiscount() {
		// arrange
		let menuItem0 = MenuItem(name: "Blueberry pancake",
														 price: 4.5,
														 isInStock: false,
														 calories: 610,
														 description: "",
														 type: .pancakes)
		let menuItem1 = MenuItem(name: "Oatmeal",
														 price: 10.70,
														 isInStock: true,
														 calories: 500,
														 description: "Some description",
														 type: .oatmeal)
		sut.orderedItems = [menuItem0: 1, menuItem1: 2]
		// act & assert
		XCTAssertEqual(sut.amountWithoutDiscount, 25.9)
		XCTAssertEqual(sut.discountedAmount, 25.9)
	}

	func testAmountWithDiscount() {
		// arrange
		let menuItem0 = MenuItem(name: "Blueberry pancake",
														 price: 4.5,
														 isInStock: false,
														 calories: 610,
														 description: "",
														 type: .pancakes)
		let menuItem1 = MenuItem(name: "Oatmeal",
														 price: 10.70,
														 isInStock: true,
														 calories: 500,
														 description: "Some description",
														 type: .oatmeal)
		sut.orderedItems = [menuItem0: 1, menuItem1: 2]
		sut.discount = .newYear

		// act & assert
		XCTAssertEqual(sut.amountWithoutDiscount, 25.9)
		XCTAssertEqual(sut.discountedAmount, 19.42)
	}
}
