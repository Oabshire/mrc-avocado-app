//
//  SectionEntity+CoreDataProperties.swift
//  MCRAvocado
//
//  Created by Onie on 16.10.2022.
//
//

import Foundation
import CoreData

extension SectionEntity {

	static func create(withTitle name: String,
										 in managedObjectContext: NSManagedObjectContext) -> SectionEntity {
		let sectionEntity = self.init(context: managedObjectContext)
		sectionEntity.name = name

		do {
			try managedObjectContext.save()
		} catch {
			let nserror = error as NSError
			fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
		}
		return sectionEntity
	}

	@nonobjc public class func fetchRequest() -> NSFetchRequest<SectionEntity> {
		return NSFetchRequest<SectionEntity>(entityName: "SectionEntity")
	}

	@NSManaged public var name: String?
	@NSManaged public var menuItems: [ItemEntity]?

}

// MARK: Generated accessors for menuItems
extension SectionEntity {

	@objc(insertObject:inMenuItemsAtIndex:)
	@NSManaged public func insertIntoMenuItems(_ value: ItemEntity, at idx: Int)

	@objc(removeObjectFromMenuItemsAtIndex:)
	@NSManaged public func removeFromMenuItems(at idx: Int)

	@objc(insertMenuItems:atIndexes:)
	@NSManaged public func insertIntoMenuItems(_ values: [ItemEntity], at indexes: NSIndexSet)

	@objc(removeMenuItemsAtIndexes:)
	@NSManaged public func removeFromMenuItems(at indexes: NSIndexSet)

	@objc(replaceObjectInMenuItemsAtIndex:withObject:)
	@NSManaged public func replaceMenuItems(at idx: Int, with value: ItemEntity)

	@objc(replaceMenuItemsAtIndexes:withMenuItems:)
	@NSManaged public func replaceMenuItems(at indexes: NSIndexSet, with values: [ItemEntity])

	@objc(addMenuItemsObject:)
	@NSManaged public func addToMenuItems(_ value: ItemEntity)

	@objc(removeMenuItemsObject:)
	@NSManaged public func removeFromMenuItems(_ value: ItemEntity)

	@objc(addMenuItems:)
	@NSManaged public func addToMenuItems(_ values: NSOrderedSet)

	@objc(removeMenuItems:)
	@NSManaged public func removeFromMenuItems(_ values: NSOrderedSet)

}

extension SectionEntity : Identifiable {

}
