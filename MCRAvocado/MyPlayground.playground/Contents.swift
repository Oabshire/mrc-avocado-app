import UIKit

// MARK: - Assignment  1

/// category of meal
enum MenuItemType {
	case scramble
	case omelets
	case eggsBenedict
	case oatmeal
	case pancake
	case waffle
	case bagel
	case dessert
	case side
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


/// Cup size for beverages
enum CupSize {
	case tall
	case grande
	case venti
}

/// MenuItem
struct MenuItem: Hashable {
	let name: String
	let price: Double
	var isInStock: Bool
	let calories: Int
	let description: String?
	let type: MenuItemType
	let withIce: Bool? // Assignment  3
	let typeOfMilk: MilkType? // Assignment  3
	let cupSize: CupSize?
	
	init(name: String, price: Double, isInStock: Bool, calories: Int, description: String? = nil, type: MenuItemType, withIce: Bool? = nil , typeOfMilk: MilkType? = nil, cupSize: CupSize? = nil) {
		self.name = name
		self.price = price
		self.isInStock = isInStock
		self.calories = calories
		self.description = description
		self.type = type
		self.withIce = withIce
		self.typeOfMilk = typeOfMilk
		self.cupSize = cupSize
	}
}

/// Order
struct Order {
	var orderedItems: [MenuItem: Int]
	let numberOfPersons: Int
	let tableNumber: Int
	let dateOfCreation: Date
	
	var totalPrice: Double {
		var totalPrice = 0.0
		for a in orderedItems {
			totalPrice += a.key.price
		}
		return totalPrice
	}
	
	// MARK: - Assignment  6
	
	mutating func addMenuItem(item: MenuItem, amount: Int) {
		guard item.isInStock else {
			print("Sorry! Out of Stock :(")
			return
		}
		let existingAmount: Int = orderedItems[item] ?? 0
		orderedItems[item] = existingAmount + amount
	}
	// MARK: - Assignment  7
	
	func createStringForPrint(from menuItem: MenuItem) -> String {
		var result = "Name: \(menuItem.name), Price: \(menuItem.price), Is in stock: \(menuItem.isInStock), Calories: \(menuItem.calories), Type: \(menuItem.type)"
		if let description = menuItem.description {
			result += ", Description: \(description)"
		}
		if let typeOfMilk = menuItem.typeOfMilk {
			result += ", Type of milk: \(typeOfMilk)"
		}
		if let withIce = menuItem.withIce {
			result += ", With ice: \(withIce)"
		}
		if let cupSize = menuItem.cupSize {
			result += ", Cup Sise: \(cupSize)"
		}
		result += ", Type: \(menuItem.type)"
		
		return result
	}
	
	func printOrderedItems() {
		for (item, amount) in orderedItems {
			print("\(createStringForPrint(from: item)) : \(amount)")
		}
	}
	
	func printOrderedItemsNameAngAmount() {
		for (item, amount) in orderedItems {
			print("\(item.name) : \(amount)")
		}
	}
}

// MARK: - Assignment  2

let orderedItems: [MenuItem: Int] = [:]

// MARK: - Assignment  4

enum DescriptionText {
	public static let butterWaffle = "Our house-made Belgian Waffle topped with whipped real butter"
	public static let eggsBaconWaffle = "Our house-made Belgian waffle is served with 2 eggs your way and 2 custom-cured hickory-smoked bacon strips"
	public static let blueberryPancake = "Four blueberry pancakes, crowned with creamy whipped topping"
	public static let icedCoffee = "Handcrafted, iced cold brew coffee made from 100% Arabica beans. Comes with milk for you to customize as you like."
}

let butterWaffle = MenuItem(name: "Waffle with butter",
							price: 12.79,
							isInStock: false,
							calories: 570,
							description: DescriptionText.butterWaffle,
							type: .waffle)

let eggsBaconWaffle = MenuItem(name: "Waffle with eggs and bacon",
							   price: 14.99,
							   isInStock: true,
							   calories: 1000,
							   description: DescriptionText.eggsBaconWaffle,
							   type: .waffle)

let blueberryPancake = MenuItem(name: "Blueberry pancake",
								price: 11.99,
								isInStock: true,
								calories: 610,
								description: DescriptionText.blueberryPancake,
								type: .pancake)

let blackTea = MenuItem(name: "Black tea",
						price: 2.99,
						isInStock: true,
						calories: 0,
						description: nil,
						type: .tea,
						withIce: nil,
						typeOfMilk: nil,
						cupSize: .tall)


let icedCoffee = MenuItem(name: "Iced cofee",
						  price: 5.99,
						  isInStock: true,
						  calories: 20,
						  description: DescriptionText.icedCoffee,
						  type: .coffee,
						  withIce: true,
						  typeOfMilk: .coconut,
						  cupSize: .tall)

let orangeJuice = MenuItem(name: "orangeJuice",
						   price: 4.99,
						   isInStock: true,
						   calories: 150,
						   description: nil,
						   type: .juice,
						   withIce: false,
						   typeOfMilk: nil,
						   cupSize: .grande)

let orangeJuiceTall = MenuItem(name: "orangeJuice",
							   price: 4.99,
							   isInStock: true,
							   calories: 150,
							   description: nil,
							   type: .juice,
							   withIce: false,
							   typeOfMilk: nil,
							   cupSize: .tall)

// MARK: - Assignment  5
var order = Order(orderedItems: [eggsBaconWaffle: 1, blueberryPancake: 1,icedCoffee:1, orangeJuice: 1],
				  numberOfPersons: 2,
				  tableNumber: 28,
				  dateOfCreation: Date())
order.addMenuItem(item: butterWaffle, amount: 2)
order.addMenuItem(item: orangeJuice, amount: 2)
order.addMenuItem(item: orangeJuiceTall, amount: 1)

// MARK: - Assignment  6

order.printOrderedItems()


order.printOrderedItemsNameAngAmount()
