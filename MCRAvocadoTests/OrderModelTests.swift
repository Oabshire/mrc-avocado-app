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
	private var menuItem: MenuItemContainer!

	override func setUpWithError() throws {
		super.setUp()
		sut = Order(orderedItems: [:])
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
		menuItem = MenuItemContainer(id: UUID(),
																 name: "Blueberry pancake",
																 price: 4.5,
																 isInStock: true,
																 calories: 610,
																 description: "",
																 type: .pancakes,
																 imageUrl: nil,
																 withIce: nil,
																 typeOfMilk: nil,
																 cupSize: nil)
		// act
		let result = sut.addMenuItem(item: menuItem, amount: 1)

		// assert
		XCTAssertTrue(result)
		XCTAssertEqual(sut.orderedItems[menuItem], 1)
	}

	func testAddNewMenuItemIsOutStock() {
		// arrange
		menuItem = MenuItemContainer(id: UUID(),
																 name: "Blueberry pancake",
																 price: 4.5,
																 isInStock: false,
																 calories: 610,
																 description: "",
																 type: .pancakes,
																 imageUrl: nil,
																 withIce: nil,
																 typeOfMilk: nil,
																 cupSize: nil)
		// act
		let result = sut.addMenuItem(item: menuItem, amount: 1)

		// assert
		XCTAssertFalse(result)
		XCTAssertNil(sut.orderedItems[menuItem])
	}
}

// MARK: - Test amountWithoutDiscount
extension OrderModelTests {
	func testAmountWithoutDiscount() {
		// arrange
		let menuItem0 = MenuItemContainer(id: UUID(),
																			name: "Blueberry pancake",
																			price: 4.5,
																			isInStock: false,
																			calories: 610,
																			description: "",
																			type: .pancakes,
																			imageUrl: nil,
																			withIce: nil,
																			typeOfMilk: nil,
																			cupSize: nil)
		let menuItem1 = MenuItemContainer(id: UUID(),
																			name: "Waffle",
																			price: 10.70,
																			isInStock: true,
																			calories: 500,
																			description: "Some description",
																			type: .oatmeal,
																			imageUrl: nil,
																			withIce: nil,
																			typeOfMilk: nil,
																			cupSize: nil)
		sut = Order(orderedItems: [menuItem0: 1, menuItem1: 2])
		// act & assert
		XCTAssertEqual(sut.amountWithoutDiscount, 25.9)
		XCTAssertEqual(sut.discountedAmount, 25.9)
	}

	func testAmountWithDiscount() {
		// arrange
		let menuItem0 = MenuItemContainer(id: UUID(),
																			name: "Blueberry pancake",
																			price: 4.5,
																			isInStock: false,
																			calories: 610,
																			description: "",
																			type: .pancakes,
																			imageUrl: nil,
																			withIce: nil,
																			typeOfMilk: nil,
																			cupSize: nil)
		let menuItem1 = MenuItemContainer(id: UUID(),
																			name: "Oatmeal",
																			price: 10.70,
																			isInStock: true,
																			calories: 500,
																			description: "Some description",
																			type: .oatmeal,
																			imageUrl: nil,
																			withIce: nil,
																			typeOfMilk: nil,
																			cupSize: nil)
		sut = Order(orderedItems: [menuItem0: 1, menuItem1: 2])
		
		sut.discount = .newYear

		// act & assert
		XCTAssertEqual(sut.amountWithoutDiscount, 25.9)
		XCTAssertEqual(sut.discountedAmount, 19.42, accuracy: 0.01)

	}
}
