import UIKit

// MARK: - Assigment 1

/// category of meal
enum MealType {
	case scramble
	case omelets
	case eggsBenedict
	case oatmeal
	case pancake
	case waffle
	case bagel
	case dessert
	case side
	case other
}


/// category of drink
enum DrinkType {
	case tea
	case coffee
	case juice
	case milkShake
	case lemonade
	case soda
	case hotChocolate
	case other
}

/// Type of milk used for coffe, tea, and hot chocolate
enum MilkType {
	case whole
	case nonFat
	case soy
	case almond
	case coconut
	case oatMilk
	case heavyCream
}


/// Cup size for Drinks
enum CupSize {
	case tall
	case grande
	case venti
}


/// Protocol for items in Menu
protocol MenuItem {
	var name: String { get }
	var price: Double { get }
	var isInStock: Bool { get }
	var calories: Int { get }
	var ingridients: String { get }
	var isVegan: Bool { get }
}

/// Meal
struct Meal: MenuItem {
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let ingridients: String
	let isVegan: Bool
	let type: MealType
}

extension Meal: Hashable {
	static func == (lhs: Meal, rhs: Meal) -> Bool {
		return lhs.name == rhs.name && lhs.name == rhs.name
	}
}

/// Beverage
struct Beverage: MenuItem {
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let ingridients: String
	let isVegan: Bool
	let type: DrinkType
	let withIce: Bool? // Assigment 3
	let typeOfMilk: MilkType?  // Assigment 3
	let cupSize: CupSize
}

extension Beverage: Hashable {
	static func == (lhs: Beverage, rhs: Beverage) -> Bool {
		return lhs.name == rhs.name && lhs.name == rhs.name
	}
}

// MARK: - Assigment 2

// I whant to create  dictionary like that:
// let order: [MenuItem: Int] = [:]
// But protocol can't be a key value
// That why I create  2 dictionaries and 1 struct instead
// I hope it's ok
let mealOrder: [Meal: Int] = [:]
let drinkOrder: [Beverage: Int] = [:]


/// Order
struct Order {
	let mealOrder: [Meal: Int]
	let drinkOrder: [Beverage: Int]
	let numberOfPersons: Int
	let totalPrice: Double
	let tableNumber: Int
	let date: Date
}
