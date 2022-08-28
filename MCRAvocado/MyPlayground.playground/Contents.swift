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
	var description: String? { get }
}

/// Meal
struct Meal: MenuItem {
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let description: String?
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
	var isInStock: Bool
	let calories: Int
	let description: String?
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
	let tableNumber: Int
	let dateOfCreation: Date
	
	var totalPrice: Double {
		var totalPrice = 0.0
		for a in mealOrder {
			totalPrice += a.key.price
		}
		return totalPrice
	}
}

// MARK: - Assigment 4

enum DescriptionText {
	public static let butterWaffle = "Our house-made Belgian Waffle topped with whipped real butter"
	public static let eggsBaconWaffle = "Our house-made Belgian waffle is served with 2 eggs your way and 2 custom-cured hickory-smoked bacon strips"
	public static let blueberryPancake = "Four blueberry pancakes, crowned with creamy whipped topping"
	public static let icedCoffee = "Handcrafted, iced cold brew coffee made from 100% Arabica beans. Comes with milk for you to customize as you like."
}

let butterWaffle = Meal(name: "Waffle with butter",
						price: 12.79,
						isInStock: false,
						calories: 570,
						description: DescriptionText.butterWaffle,
						type: .waffle)

let eggsBaconWaffle = Meal(name: "Waffle with eggs and bacon",
						   price: 14.99,
						   isInStock: true,
						   calories: 1000,
						   description: DescriptionText.eggsBaconWaffle,
						   type: .waffle)

let blueberryPancake = Meal(name: "Blueberry pancake",
							price: 11.99,
							isInStock: true,
							calories: 610,
							description: DescriptionText.blueberryPancake,
							type: .pancake)

let blackTea = Beverage(name: "Black tea",
						price: 2.99,
						isInStock: true,
						calories: 0,
						description: nil,
						type: .tea,
						withIce: nil,
						typeOfMilk: nil,
						cupSize: .tall)


let icedCoffee = Beverage(name: "Iced cofee",
						  price: 5.99,
						  isInStock: true,
						  calories: 0,
						  description: DescriptionText.icedCoffee,
						  type: .coffee,
						  withIce: true,
						  typeOfMilk: .coconut,
						  cupSize: .tall)

let orangeJuice = Beverage(name: "orangeJuice",
						   price: 4.99,
						   isInStock: true,
						   calories: 150,
						   description: nil,
						   type: .juice,
						   withIce: false,
						   typeOfMilk: nil,
						   cupSize: .grande)

let firstOrder = Order(mealOrder: [eggsBaconWaffle: 1, blueberryPancake: 1],
					   drinkOrder: [icedCoffee:1, orangeJuice: 1],
					   numberOfPersons: 2,
					   tableNumber: 28,
					   dateOfCreation: Date())

