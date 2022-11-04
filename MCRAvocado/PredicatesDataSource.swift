//
//  PredicatesDataSource.swift
//  MCRAvocado
//
//  Created by Onie on 03.11.2022.
//

import CoreData

let predicatesDataSource = [
	(name: "ALL", predicate: nil),
	(name: "Waffles", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.waffles.rawValue)),
	(name: "Eggs Benedict", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.eggsBenedict.rawValue)),
	(name: "Oatmeal", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.oatmeal.rawValue)),
	(name: "Omelletes", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.omelletes.rawValue)),
	(name: "Bagels", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.bagel.rawValue)),
	(name: "Pancakes", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.pancakes.rawValue)),
	(name: "Desserts", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.dessert.rawValue)),
	(name: "Cold Drink", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.coldDrinks.rawValue)),
	(name: "Hot Drink", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.hotDrinks.rawValue))
]
