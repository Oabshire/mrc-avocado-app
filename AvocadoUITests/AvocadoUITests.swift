//
//  AvocadoUITests.swift
//  AvocadoUITests
//
//  Created by Onie on 23.10.2022.
//

import XCTest

class AvocadoUITests: XCTestCase {
	var app: XCUIApplication!

	override func setUp() {
		super.setUp()
		continueAfterFailure = false

		app = XCUIApplication()
		app.launchArguments = ["-ui-testing"]
		app.launchEnvironment = ["-networking-success": "1"]
		app.launch()
	}

	override func tearDown() {
		app = nil
		super.tearDown()
	}

	func testTabs() {
		// given

//		let app = XCUIApplication()

		let discountsTab = app.tabBars["Tab Bar"].buttons["Discounts"]
		let menuTab = app.tabBars["Tab Bar"].buttons["Menu"]
		let orderTab = app.tabBars["Tab Bar"].buttons["Cart"]

		// then
		XCTAssertTrue(discountsTab.exists)
		XCTAssertTrue(menuTab.exists)
		XCTAssertTrue(orderTab.exists)

		discountsTab.tap()
		if discountsTab.isSelected {
			print("selected disc")
			XCTAssertTrue(app.navigationBars["Discounts"].staticTexts["Discounts"].exists)
		}

		orderTab.tap()
		if menuTab.isSelected {
			print("selected order")
			XCTAssertTrue(app.navigationBars["Cart"].staticTexts["Cart"].exists)
			XCTAssertTrue(app.staticTexts["Your Cart is empty"].exists)
			XCTAssertTrue(app.images["Shopping Cart"].exists)
		}

		menuTab.tap()
		if menuTab.isSelected {
			print("selected menu")
			XCTAssertTrue(app.navigationBars["Menu"].staticTexts["Menu"].exists)
		}
	}

	func testNonEmptyCartTabs() {

		app.tables.cells["Oatmeal, $ 7.99, Kcal 300, High in fiber and antioxidant, 100% whole grain! The best healthy breakfast ever."].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()

		app.buttons["ADD TO ORDER"].tap()

		// then
		let cartTab =	app.tabBars["Tab Bar"].buttons["Cart"]
		cartTab.tap()
		if cartTab.isSelected {
			XCTAssertTrue(app.navigationBars["Cart"].staticTexts["Cart"].exists)
			XCTAssertFalse(app.staticTexts["Your Cart is empty"].exists)
			XCTAssertFalse(app.images["Shopping Cart"].exists)
			XCTAssertTrue(app/*@START_MENU_TOKEN@*/.tables.containing(.cell, identifier:"Oatmeal, $ 7.99 × 1").element/*[[".otherElements[\"1\"].tables.containing(.cell, identifier:\"Oatmeal, $ 7.99 × 1\").element",".tables.containing(.cell, identifier:\"Oatmeal, $ 7.99 × 1\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
		}
	}

	func testDrinkDetailView() {
		// given
		app.tables/*@START_MENU_TOKEN@*/.buttons["Hot coffee, $ 2.99, Kcal 0"]/*[[".cells[\"Hot coffee, $ 2.99, Kcal 0\"].buttons[\"Hot coffee, $ 2.99, Kcal 0\"]",".buttons[\"Hot coffee, $ 2.99, Kcal 0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

		// then
		XCTAssertTrue(app.staticTexts["Size of cup"].exists)
		XCTAssertTrue(app.staticTexts["Type of milk"].exists)
	}
}
