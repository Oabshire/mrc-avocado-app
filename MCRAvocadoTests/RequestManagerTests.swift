//
//  RequestManagerTests.swift
//  MCRAvocadoTests
//
//  Created by Onie on 22.10.2022.
//

import XCTest
@testable import Avocado

final class RequestManagerTests: XCTestCase {
	private var requestManager: RequestManagerProtocol?

	override func setUp() {
		super.setUp()
		guard let userDefaults = UserDefaults(suiteName: #file) else {
			return
		}

		userDefaults.removePersistentDomain(forName: #file)

		requestManager = RequestManager(
			apiManager: APIManagerMock()
		)
	}
}

extension RequestManagerTests {
	func testRequestMenu() async throws {
		// arrange & act
		guard let container: [MenuSectionContainer] =
						try await requestManager?.perform(
							MenuRequestMock.getMenu) else {
			XCTFail("Didn't get data from the request manager")
			return
		}

		let firstSection = try XCTUnwrap(container.first)
		let lastSection = try XCTUnwrap(container.last)

		let firstSectionMenuItem = try XCTUnwrap(firstSection.menuItems.first)
		let lastSectionMenuItem = try XCTUnwrap(lastSection.menuItems.first)

		// assert
		
		XCTAssertEqual(firstSection.name, "waffles")
		XCTAssertEqual(firstSection.menuItems.count, 1)
		XCTAssertEqual(firstSectionMenuItem.name, "Waffle with bacon")
		XCTAssertEqual(firstSectionMenuItem.id,
									 UUID(uuidString: "d27640f7-17b9-4979-b4b7-4b28849bac0a"))
		XCTAssertEqual(lastSection.name, "cold drinks")
		XCTAssertEqual(lastSection.menuItems.count, 1)
		XCTAssertEqual(lastSectionMenuItem.name, "Iced coffee")
		XCTAssertEqual(lastSectionMenuItem.id,
									 UUID(uuidString: "8e866cad-506c-43c1-98ff-43c4c92919a2"))
	}
}
