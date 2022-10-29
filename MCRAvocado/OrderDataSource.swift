//
// OrderDataSource.swift
// MCRAvocado
//
// Created by Onie on 11.09.2022.
//

import Foundation

let orderDataSource = Order(orderedItems: [MenuItemContainer(id: UUID(),
																														 name: "Waffle with bacon",
																														 price: 14.99,
																														 isInStock: true,
																														 calories: 1000,
																														 description: "",
																														 type: .waffles,
																														 imageUrl: nil,
																														 withIce: nil,
																														 typeOfMilk: nil,
																														 cupSize: nil): 1,
																					 MenuItemContainer(id: UUID(),
																														 name: "Blueberry pancake",
																														 price: 11.99,
																														 isInStock: true,
																														 calories: 610,
																														 description: "",
																														 type: .pancakes,
																														 imageUrl: nil,
																														 withIce: nil,
																														 typeOfMilk: nil,
																														 cupSize: nil): 1,
																					 MenuItemContainer(id: UUID(),
																														 name: "Iced coffee",
																														 price: 5.99,
																														 isInStock: true,
																														 calories: 20,
																														 description: "",
																														 type: .coldDrinks,
																														 imageUrl: nil,
																														 withIce: true,
																														 typeOfMilk: .coconut,
																														 cupSize: .tall): 1,
																					 MenuItemContainer(id: UUID(),
																														 name: "Orange juice",
																														 price: 4.99,
																														 isInStock: true,
																														 calories: 150,
																														 description: nil,
																														 type: .coldDrinks,
																														 imageUrl: nil,
																														 withIce: false,
																														 typeOfMilk: nil,
																														 cupSize: .grande): 1])
