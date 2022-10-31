//
//  MenuItemToAddBuilderTests.swift
//  MCRAvocadoTests
//
//  Created by Onie on 22.10.2022.
//

import XCTest
@testable import Avocado

final class MenuItemToAddBuilderTests: XCTestCase {
	private var sut: MenuItemToAddBuilder!

	override func setUpWithError() throws {
		super.setUp()
		sut = MenuItemToAddBuilder()
	}

	override func tearDownWithError() throws {
		sut = nil
		super.tearDown()
	}
}

// MARK: - Test buildMenuItem
extension MenuItemToAddBuilderTests {
	func testBuildMenuItemForColdDrink() {
		// arrange
		let	menuItem = MenuItemContainer(id: UUID(),
																		 name: "Orange Juice",
																		 price: 3.0,
																		 isInStock: true,
																		 calories: 30,
																		 description: nil,
																		 type: .coldDrinks,
																		 imageUrl: nil,
																		 withIce: nil,
																		 typeOfMilk: nil,
																		 cupSize: nil)
		sut.price = 3.5
		sut.milkType = .whole
		sut.cupSize = .venti
		sut.iced = true
		
		// act
		let result = sut.buildMenuItem(from: menuItem)

		// assert

		XCTAssertNil(result.typeOfMilk)
		XCTAssertEqual(result.withIce, true)
		XCTAssertEqual(result.price, 3.5)
		XCTAssertEqual(result.cupSize, .venti)
		XCTAssertEqual(result.name, "Venti Orange Juice with ice")
	}

	func testBuildMenuItemForHotDrink() {
		// arrange
		let	menuItem = MenuItemContainer(id: UUID(),
																		 name: "Hot Chocolate",
																		 price: 5.25,
																		 isInStock: true,
																		 calories: 30,
																		 description: nil,
																		 type: .hotDrinks,
																		 imageUrl: nil,
																		 withIce: nil,
																		 typeOfMilk: nil,
																		 cupSize: nil)

		sut.price = 5
		sut.milkType = .nonFat
		sut.cupSize = .tall
		sut.iced = true

		// act
		let result = sut.buildMenuItem(from: menuItem)

		// assert

		XCTAssertEqual(result.typeOfMilk, .nonFat)
		XCTAssertNil(result.withIce)
		XCTAssertEqual(result.price, 5)
		XCTAssertEqual(result.cupSize, .tall)
		XCTAssertEqual(result.name, "Tall Hot Chocolate with nonfat milk")
	}

	func testBuildMenuItemForNonDrink() {
		// arrange

		let	menuItem = MenuItemContainer(id: UUID(),
																		 name: "Blueberry pancake",
																		 price: 4.5,
																		 isInStock: true,
																		 calories: 610,
																		 description: nil,
																		 type: .pancakes,
																		 imageUrl: nil,
																		 withIce: nil,
																		 typeOfMilk: nil,
																		 cupSize: nil)

		sut.price = 5
		sut.milkType = .nonFat
		sut.cupSize = .tall
		sut.iced = true

		// act
		let result = sut.buildMenuItem(from: menuItem)

		// assert

		XCTAssertNil(result.typeOfMilk)
		XCTAssertNil(result.withIce)
		XCTAssertNil(result.cupSize)
		XCTAssertEqual(result.price, menuItem.price)
		XCTAssertEqual(result.name, menuItem.name)
	}
}
