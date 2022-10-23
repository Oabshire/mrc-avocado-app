//
//  ItemEntity+CoreDataProperties.swift
//  MCRAvocado
//
//  Created by Onie on 16.10.2022.
//

import CoreData
import SwiftUI

extension ItemEntity {
	@NSManaged public var name: String
	@NSManaged public var price: Double
	@NSManaged public var calories: Int16
	@NSManaged public var descript: String?
	@NSManaged public var type: String
	@NSManaged public var isInStock: Bool
	@NSManaged public var imageUrl: URL?
	@NSManaged public var id: UUID
	@NSManaged public var section: SectionEntity

	static func createWith(item: MenuItemContainer,
												 in section: SectionEntity,
												 using managedObjectContext: NSManagedObjectContext) {
		let itemEntity = ItemEntity(context: managedObjectContext)
		itemEntity.name = item.name
		itemEntity.id = item.id
		itemEntity.imageUrl = item.imageUrl
		itemEntity.descript = item.description
		itemEntity.price = item.price
		itemEntity.calories = Int16(item.calories)
		itemEntity.type = item.type.rawValue
		itemEntity.isInStock = item.isInStock
		itemEntity.section = section
		do {
			try managedObjectContext.save()
		} catch {
			let nserror = error as NSError
			fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
		}
	}
}
