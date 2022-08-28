import UIKit


enum MealType {
	case scramble
	case omelets
	case eggsBenedict
	case oatmeal
	case pancake
	case waffle
	case bagel
	case dessert
	case other
}

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

enum MilkType {
	case whole
	case nonFat
	case soy
	case almond
	case coconut
	case oatMilk
	case heavyCream
}

enum CupSize {
	case tall
	case grande
	case venti
}

protocol MenuItem {
	var name: String { get }
	var price: Double { get }
	var isInStock: Bool { get }
	var calories: Int { get }
	var ingridients: String { get }
	var isVegan: Bool { get }
}


protocol SizeType {
	var name: String { get }
	var price: Double { get }
	var isInStock: Bool { get }
	var calories: Int { get }
	var ingridients: String { get }
	var isVegan: Bool { get }
}

struct Meal: MenuItem {
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let type: MealType
	let ingridients: String
	let isVegan: Bool
	let sides: [Sides]
}

struct Sides: MenuItem {
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let type: MealType
	let ingridients: String
	let isVegan: Bool
}

struct Beverage: MenuItem {
	var type: DrinkType
	var ingridients: String
	var isVegan: Bool
	let name: String
	let price: Double
	let isInStock: Bool
	let calories: Int
	let withIce: Bool
	let typeOfMilk: MilkType
	let cupSize: CupSize
}
