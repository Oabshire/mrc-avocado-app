//
//  Persistence.swift
//  MCRAvocado
//
//  Created by Onie on 16.10.2022.
//

import CoreData

struct PersistenceController {

	static let shared = PersistenceController()

	static var preview: PersistenceController = {
		let result = PersistenceController(inMemory: true)
		let viewContext = result.container.viewContext

		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
		return result
	}()

	static let unitTest: PersistenceController = {
			let result = PersistenceController(inMemory: true)
			return result
	}()

	let container: NSPersistentContainer

	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "AvocadoMenu")
		if inMemory {
			// swiftlint:disable:next force_unwrapping
			container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
		}
		container.loadPersistentStores { _, error in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		}
		container.viewContext.automaticallyMergesChangesFromParent = true

		container.viewContext.name = "viewContext"
		container.viewContext.mergePolicy =
		NSMergeByPropertyObjectTrumpMergePolicy
		container.viewContext.undoManager = nil
		container.viewContext.shouldDeleteInaccessibleFaults = true
	}

	static func deleteSection(section: SectionEntity, in context: NSManagedObjectContext) throws {
		context.delete(section)
		try context.save()
	}
}
