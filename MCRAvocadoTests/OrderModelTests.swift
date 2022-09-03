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
		sut = Order(orderedItems: [menuItem: 2], numberOfPersons: 2, tableNumber: 7, dateOfCreation: Date())
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
		menuItem = MenuItem(name: "Cinnamon Roll",
							price: 4.5,
							isInStock: true,
							calories: 150,
							description: "Some description",
							type: .side)
		// act
		let result = sut.addMenuItem(item: menuItem, amount: 1)
		
		// assert
		XCTAssertTrue(result)
		XCTAssertEqual(sut.orderedItems[menuItem], 1)
	}
	
	func testAddNewMenuItemIsOutStock() {
		// arrange
		menuItem = MenuItem(name: "Cinnamon Roll",
							price: 4.5,
							isInStock: false,
							calories: 150,
							description: "Some description",
							type: .side)
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
