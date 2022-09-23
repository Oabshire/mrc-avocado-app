//
//  OrderDataSource.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

let orderDataSource = Order(orderedItems: [MenuItem(name: "Waffle with bacon",
																										price: 14.99,
																										isInStock: true,
																										calories: 1000,
																										description:"",
																										type: .waffles, imageName: "waffle_with_bacon") : 1,
																					 MenuItem(name: "Blueberry pancake",
																										price: 11.99,
																										isInStock: true,
																										calories: 610,
																										description:"",
																										type: .pancakes, imageName: "blueberry_pancake") : 1,
																					 MenuItem(name: "Iced coffee",
																										price: 5.99,
																										isInStock: true,
																										calories: 20,
																										description:"",
																										type: .coldDrinks,
																										withIce: true,
																										typeOfMilk: .coconut,
																										cupSize: .tall, imageName: "iced_coffee") :1,
																					 MenuItem(name: "Orange juice",
																										price: 4.99,
																										isInStock: true,
																										calories: 150,
																										description: nil,
																										type: .coldDrinks,
																										withIce: false,
																										typeOfMilk: nil,
																										cupSize: .grande, imageName: "orange_juice") : 1])
