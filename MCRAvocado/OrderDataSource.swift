//
//  OrderDataSource.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

var orderDataSource = Order(orderedItems: [MenuItem(name: "Waffle with eggs and bacon",
																										price: 14.99,
																										isInStock: true,
																										calories: 1000,
																										description:"",
																										type: .waffles) : 1,
																					 MenuItem(name: "Blueberry pancake",
																										price: 11.99,
																										isInStock: true,
																										calories: 610,
																										description:"",
																										type: .pancakes) : 1,
																					 MenuItem(name: "Iced coffee",
																										price: 5.99,
																										isInStock: true,
																										calories: 20,
																										description:"",
																										type: .coldDrinks,
																										withIce: true,
																										typeOfMilk: .coconut,
																										cupSize: .tall) :1,
																					 MenuItem(name: "orangeJuice",
																										price: 4.99,
																										isInStock: true,
																										calories: 150,
																										description: nil,
																										type: .coldDrinks,
																										withIce: false,
																										typeOfMilk: nil,
																										cupSize: .grande) : 1])
