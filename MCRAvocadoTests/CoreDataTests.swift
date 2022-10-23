//
//  CoreDataTests.swift
//  MCRAvocadoTests
//
//  Created by Onie on 22.10.2022.
//

import XCTest
import CoreData
@testable import Avocado

final
class TestCoreDataStack: XCTestCase {
	// MARK: - Properties
	var coreDataStack: PersistenceController!
	var sectionFetchRequest: NSFetchRequest<SectionEntity>!
	var context: NSManagedObjectContext!
	
	
	override func setUp() {
		super.setUp()
		coreDataStack = PersistenceController.unitTest
		sectionFetchRequest =  {
			let request: NSFetchRequest<SectionEntity> = SectionEntity.fetchRequest()
			request.sortDescriptors = []
			return request
		}()
		context = coreDataStack.container.viewContext
	}
	
	override func tearDownWithError() throws {
		super.tearDown()
		let sections = try context.fetch(sectionFetchRequest)
		for section in sections {
			try PersistenceController.deleteSection(section: section, in: context)
		}
		context = nil
		sectionFetchRequest = nil
		coreDataStack = nil
	}
	
	
	
	func testAddSectionWithItem() throws {
		
		// arrange & act
		expectation(forNotification: .NSManagedObjectContextDidSave, object: context) { _ in
			return true
		}
		
		let menuItemsContaitem = MenuItemContainer(id: UUID(),
																							 name: "Blueberry pancakes",
																							 price: 11.99,
																							 isInStock: true,
																							 calories: 610,
																							 description: TextLibrary.MenuItemDescription.blueberryPancake,
																							 type: .hotDrinks,
																							 imageUrl: nil)
		let sectionEnity = SectionEntity.create(withTitle: "Test section name" , in: context)
		let _ = ItemEntity.createWith(item: menuItemsContaitem,
																	in: sectionEnity,
																	using: context)
		// assert
		waitForExpectations(timeout: 2.0) { error in
			XCTAssertNil(error, "Save did not occur")
		}
	}
	
	func testDeleteSectionWithItem() throws {
		
		// arrange & act
		let menuItemsContaitem = MenuItemContainer(id: UUID(),
																							 name: "Blueberry pancakes",
																							 price: 11.99,
																							 isInStock: true,
																							 calories: 610,
																							 description: TextLibrary.MenuItemDescription.blueberryPancake,
																							 type: .hotDrinks,
																							 imageUrl: nil)
		let sectionEnity = SectionEntity.create(withTitle: "Test section name" , in: context)
		let _ = ItemEntity.createWith(item: menuItemsContaitem,
																	in: sectionEnity,
																	using: context)
		let sectionsToDelete = try context.fetch(sectionFetchRequest)
		for section in sectionsToDelete {
			try PersistenceController.deleteSection(section: section, in: context)
		}
		let sectionsResult = try context.fetch(sectionFetchRequest)
		
		// assert
		
		XCTAssertEqual(sectionsResult.count, 0)
		XCTAssertNil(sectionsResult.first)
	}

	func testPredicatesType() throws {


		let menuItemsContaitem0 = MenuItemContainer(id: UUID(),
																								name: "Blueberry pancakes",
																								price: 11.99,
																								isInStock: true,
																								calories: 610,
																								description: TextLibrary.MenuItemDescription.blueberryPancake,
																								type: .pancakes,
																								imageUrl: nil)
		let sectionEnity0 = SectionEntity.create(withTitle: "pancakes" , in: context)
		let _ = ItemEntity.createWith(item: menuItemsContaitem0,
																	in: sectionEnity0,
																	using: context)

		let menuItemsContaitem1 = MenuItemContainer(id: UUID(),
																								name: "Waffles",
																								price: 11.99,
																								isInStock: true,
																								calories: 610,
																								description: TextLibrary.MenuItemDescription.blueberryPancake,
																								type: .waffles,
																								imageUrl: nil)
		let sectionEnity1 = SectionEntity.create(withTitle: "Waffles" , in: context)
		let _ = ItemEntity.createWith(item: menuItemsContaitem1,
																	in: sectionEnity1,
																	using: context)


		sectionFetchRequest.predicate = NSPredicate(format: "%K == %@", "name", MenuItemType.pancakes.rawValue)
		let sectionsResult = try context.fetch(sectionFetchRequest)

		XCTAssertEqual(sectionsResult.count, 1)
		let firstSection = try XCTUnwrap(sectionsResult.first)
		XCTAssertEqual(firstSection.name, "pancakes")
		XCTAssertEqual(firstSection.menuItems?.count, 1)
		let firstSectionMenuItem = try XCTUnwrap(firstSection.menuItems?.first)
		XCTAssertEqual(firstSectionMenuItem.type, MenuItemType.pancakes.rawValue)
	}
}

